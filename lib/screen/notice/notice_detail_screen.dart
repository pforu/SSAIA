import 'package:flutter/material.dart';
import 'package:infinite_calendar_view/infinite_calendar_view.dart';
import 'package:ssaiaforme/model/data_model.dart';
import 'package:ssaiaforme/screen/calendar/calendar_screen.dart';
import 'package:url_launcher/url_launcher.dart';

import '../main_screen.dart';



/*
class NoticeDetailScreen extends StatefulWidget {
  final DataModel notice;
  final EventsController controller;

  const NoticeDetailScreen({
    super.key,
    required this.notice,
    required this.controller,
  });

  @override
  State<NoticeDetailScreen> createState() => _NoticeDetailScreenState();
}

class _NoticeDetailScreenState extends State<NoticeDetailScreen> {
  @override
  void initState() {
    super.initState();
    _loadEvents();
  }

  void _loadEvents() {
    final notice = widget.notice;
    if (notice.periods != null) {
      for (var period in notice.periods) {
        final startDate = DateTime.parse(period.startDate);
        final endDate = DateTime.parse(period.endDate);
        final type = period.type;

        final event = Event(
          startTime: startDate,
          endTime: endDate,
          title: notice.title ?? '',
          color: type == 'application' ? Colors.yellow : Colors.green,
          data: switch (notice.site) {
            'cs' => Icons.code,
            'ds' => Icons.bar_chart,
            'sw' => Icons.developer_mode,
            'co' => Icons.insert_chart,
            _ => Icons.help,
          },
          description: switch (notice.site) {
            'cs' => '컴퓨터과학전공',
            'ds' => '데이터사이언스전공',
            'sw' => 'SW중심대학사업단',
            'co' => '빅데이터혁신융합대학사업단',
            _ => '기타',
          },
        );
        widget.controller.updateCalendarData(
          (calendarData) => calendarData.addEvents([event]),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final notice = widget.notice;

    return Scaffold(
      appBar: AppBar(
        title: Text(notice.title ?? '공지 상세'),
        leading: BackButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Text(notice.contentText ?? ''),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                _loadEvents();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text('캘린더에 추가 완료'),
                    action: SnackBarAction(
                      label: '캘린더 보기',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                                CalendarScreen(controller: widget.controller),
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
              child: const Text('캘린더에 추가'),
            ),
          ],
        ),
      ),
    );
  }
}
*/

class NoticeDetailScreen extends StatefulWidget {
  final DataModel notice;
  final EventsController controller;
  final VoidCallback? onCalendarRequested;

  const NoticeDetailScreen({
    super.key,
    required this.notice,
    required this.controller,
    this.onCalendarRequested,
  });

  @override
  State<NoticeDetailScreen> createState() => _NoticeDetailScreenState();
}

class _NoticeDetailScreenState extends State<NoticeDetailScreen> {
  @override
  void initState() {
    super.initState();
  }

  void _loadEvents() {
    final notice = widget.notice;
    if (notice.periods.isNotEmpty) {
      for (var period in notice.periods) {
        final startDate = DateTime.parse(period.startDate);
        //print(startDate);
        final endDate = DateTime.parse(period.endDate);
        //print(endDate);
        final type = period.type;

        final event = Event(
          startTime: startDate,
          endTime: endDate,
          title: notice.title,
          color: type == 'application' ? Colors.blueGrey : Colors.indigoAccent,
          data: switch (notice.site) {
            'cs' => Icons.code,
            'ds' => Icons.bar_chart,
            'sw' => Icons.developer_mode,
            'co' => Icons.insert_chart,
            _ => Icons.help,
          },
          description: switch (notice.site) {
            'cs' => '컴퓨터과학전공',
            'ds' => '데이터사이언스전공',
            'sw' => 'SW중심대학사업단',
            'co' => '빅데이터혁신융합대학사업단',
            _ => '기타',
          },
        );
        //print(startDate);
        widget.controller.updateCalendarData(
          (calendarData) => calendarData.addEvents([event]),
        );
      }
    }
  }

  Widget buildAttachments(List<AttachmentData> attachments) {
    if (attachments.isEmpty) return const SizedBox();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        const Text('첨부파일', style: TextStyle(fontWeight: FontWeight.bold)),
        ...attachments.map(
          (a) => TextButton.icon(
            onPressed: () async {
              final url = Uri.parse(a.url);
              if (await canLaunchUrl(url)) {
                await launchUrl(url, mode: LaunchMode.externalApplication);
              }
            },
            icon: const Icon(Icons.attach_file),
            label: Text(a.text),
          ),
        ),
      ],
    );
  }

  /*
  Widget buildTable(List<List<Map<int, String>>> tableData) {
    if (tableData.isEmpty) return const SizedBox();
    final rows = tableData.first;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        const Text('표 내용', style: TextStyle(fontWeight: FontWeight.bold)),
        Table(
          border: TableBorder.all(),
          children: rows
              .map(
                (row) => TableRow(
              children: [
                for (int i = 0; i < row.length; i++)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(row[i] ?? ''),
                  ),
              ],
            ),
          )
              .toList(),
        ),
      ],
    );
  }


  Widget buildImages(List<String> images) {
    if (images.isEmpty) return const SizedBox();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        const Text('이미지', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        ...images.map(
              (img) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Image.network(img, fit: BoxFit.contain),
          ),
        ),
      ],
    );
  }
 */

  // Widget buildTable(List<TableRowData> tableData) {
  //   if (tableData.isEmpty) return const SizedBox();
  //   final maxCells = tableData.map((r) => r.row.values.length).reduce((a, b) => a > b ? a : b);
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       const SizedBox(height: 16),
  //       //const Text('표 내용', style: TextStyle(fontWeight: FontWeight.bold)),
  //       Table(
  //         border: TableBorder.all(),
  //         children: tableData.map((rowData) {
  //           final row = rowData.row.values.toList();
  //           while (row.length < maxCells) {
  //             row.add('');
  //           }
  //           return TableRow(
  //             children: row
  //                 .map(
  //                   (cell) => Padding(
  //                     padding: const EdgeInsets.all(8.0),
  //                     child: Text(cell ?? ''),
  //                   ),
  //                 )
  //                 .toList(),
  //           );
  //         }).toList(),
  //       ),
  //     ],
  //   );
  // }

  Widget buildTable(List<TableRowData> tableData) {
    if (tableData.isEmpty) return const SizedBox();

    final rowCount = tableData.length;
    final colCount = tableData[0].row.keys.length;

    // 세로 병합 정보를 열 단위로 계산
    List<List<int>> verticalSpans = List.generate(
        rowCount, (_) => List.generate(colCount, (_) => 1));

    for (int col = 0; col < colCount; col++) {
      int r = 0;
      while (r < rowCount) {
        final currentValue = tableData[r].row[col.toString()] ?? '';
        int span = 1;
        for (int nr = r + 1; nr < rowCount; nr++) {
          if (tableData[nr].row[col.toString()] == currentValue) {
            span++;
          } else {
            break;
          }
        }
        // 병합된 아래쪽 셀은 0으로 표시, 위쪽 셀에 span 저장
        for (int nr = r + 1; nr < r + span; nr++) {
          verticalSpans[nr][col] = 0;
        }
        verticalSpans[r][col] = span;
        r += span;
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        ...List.generate(rowCount, (i) {
          final row = tableData[i].row;
          final keys = row.keys.toList()
            ..sort((a, b) => int.parse(a).compareTo(int.parse(b)));

          List<Widget> cells = [];
          int k = 0;

          while (k < keys.length) {
            final current = row[keys[k]] ?? '';
            int span = 1;

            // ==== 가로 병합 ====
            for (int j = k + 1; j < keys.length; j++) {
              if (row[keys[j]] == current) {
                span++;
              } else {
                break;
              }
            }

            // ==== 세로 병합 ====
            int verticalSpan = verticalSpans[i][int.parse(keys[k])];

            // 이미 병합된 아래쪽 셀은 렌더링하지 않음
            if (verticalSpan == 0) {
              k += span;
              continue;
            }

            if (current.isNotEmpty) {
              cells.add(
                Expanded(
                  flex: span,
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(
                      vertical: 10.0 * verticalSpan,
                      horizontal: 8.0,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey.shade400, width: 0.6),
                    ),
                    child: Text(
                      current,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 13, height: 1.4),
                    ),
                  ),
                ),
              );
            }

            k += span;
          }

          return Row(children: cells);
        }),
      ],
    );
  }








  Widget buildImages(List<ImageData> images) {
    if (images.isEmpty) return const SizedBox();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        const Text('이미지', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        ...images.map(
          (imgData) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Image.network(imgData.url, fit: BoxFit.contain),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final notice = widget.notice;
    final hasPeriods = notice.periods.isNotEmpty;

    return Scaffold(
      appBar: AppBar(title: Text(notice.title), leading: const BackButton()),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      notice.contentText,
                      style: const TextStyle(fontSize: 16),
                    ),
                    buildTable(notice.contentTable),
                    buildAttachments(notice.contentAttachment),
                    buildImages(notice.contentImages),
                  ],
                ),
              ),
            ),
            if (hasPeriods)
              ElevatedButton(
                onPressed: () {
                  _loadEvents();
                  print(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text('캘린더에 추가 완료'),
                      action: SnackBarAction(
                        label: '캘린더 보기',
                        onPressed: () {
                          // 상세 닫기

                          if (widget.onCalendarRequested != null) {
                            widget.onCalendarRequested!();
                          }
                          Navigator.pop(context);
                          //Navigator.pop(context);
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (_) =>
                          //         CalendarScreen(controller: widget.controller),
                          //   ),
                          // );
                        },
                      ),
                    ),
                  );
                },
                child: const Text('캘린더에 추가'),
              ),
          ],
        ),
      ),
    );
  }
}
