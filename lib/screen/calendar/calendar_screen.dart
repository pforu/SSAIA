import 'package:flutter/material.dart';
import 'package:ssaiaforme/model/data_model.dart';
import 'package:ssaiaforme/screen/main_screen.dart';
import 'package:ssaiaforme/screen/notice/notice_detail_screen.dart';
import 'package:infinite_calendar_view/infinite_calendar_view.dart';
import 'package:intl/intl.dart';

//import 'app.dart';

String formatDate(DateTime? date) {
  if (date == null) return '날짜 미정';
  return DateFormat('yyyy.MM.dd (E) HH:mm').format(date);
}

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key, required this.controller}); // 이름 통일

  final EventsController controller;

  static final heightPerMinute = 1.0;
  static final initialVerticalScrollOffset = heightPerMinute * 7 * 60;


  @override
  Widget build(BuildContext context) {


    final siteMap = {
      'cs': {'name': '컴퓨터과학전공', 'icon': Icons.code},
      'ds': {'name': '데이터사이언스전공', 'icon': Icons.developer_mode},
      'sw': {'name': 'SW중심대학사업단', 'icon': Icons.bar_chart},
      'co': {'name': '빅데이터혁신융합대학사업단', 'icon': Icons.insert_chart},
    };

    return
    // appBar: AppBar(title: const Text('캘린더')),
    // bottomNavigationBar: NavigationBar(
    //   destinations: const [
    //     NavigationDestination(icon: Icon(Icons.home), label: '홈'),
    //     NavigationDestination(icon: Icon(Icons.calendar_today), label: '캘린더'),
    //   ],
    //   selectedIndex: 1,
    // ),
    SafeArea(
      child: Material(
        child: EventsMonths(
          controller: controller,
          daysParam: DaysParam(
            dayEventBuilder: (event, height, width) {
              return InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (_) {
                      //print(event.startTime);
                      //print(event.endTime);
                      final start = event.startTime != null
                          ? DateFormat('yyyy.MM.dd (E) HH:mm').format(event.startTime!)
                          : DateFormat('yyyy.MM.dd (E) 00:00').format(event.startTime);
                      final end = event.endTime != null
                          ? DateFormat('yyyy.MM.dd (E) HH:mm').format(event.endTime!)
                          : DateFormat('yyyy.MM.dd (E) 23:59').format(event.startTime);
                      // final start = formatDate(event.startTime);
                      // final end = formatDate(event.endTime);
                      return AlertDialog(
                        // icon: event.data is Icon
                        //     ? event.data as Icon
                        //     : Icon(Icons.help),
                        // title: Text(event.description ?? ''),
                        // content: Text(event.description ?? ''),
                        title: Row(
                          children: [
                            Icon(
                              event.data is IconData
                                  ? event.data as IconData
                                  : Icons.help,
                              color: event.color,
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                event.description ?? '기타',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        // content: Text(event.title ?? '내용 없음'),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              event.title ?? '이벤트 제목 없음',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 8),
                            // Text(event.),
                            // const SizedBox(height: 8),
                            Text(
                              '$start ~ $end',
                              style: const TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
                child: Container(
                  width: width,
                  height: height,
                  decoration: BoxDecoration(
                    color: event.color.withValues(alpha: 0.8),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    event.title ?? '',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
