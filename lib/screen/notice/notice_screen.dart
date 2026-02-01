import 'package:flutter/material.dart';
import 'package:ssaiaforme/data/data_get.dart';
import 'package:ssaiaforme/model/smaple_data_json2.dart';
import 'package:ssaiaforme/screen/notice/notice_detail_screen.dart';
import 'package:infinite_calendar_view/infinite_calendar_view.dart';
import 'dart:async';
import 'package:dio/dio.dart';
import 'package:ssaiaforme/model/data_model.dart';
import 'package:ssaiaforme/model/sample_data_json.dart';

class NoticeScreen extends StatefulWidget {
  final EventsController controller;
  final VoidCallback? onCalendarRequested;

  const NoticeScreen({super.key, required this.controller, this.onCalendarRequested, });

  @override
  State<NoticeScreen> createState() => _NoticeScreenState();
}

class _NoticeScreenState extends State<NoticeScreen> {
  // List<Map<String, dynamic>> notices = [];
  // Timer? _timer;
  //
  // final List<Map<String, dynamic>> sampleNotices = sampleNoticeJson;
  final List<Map<String, dynamic>> sampleNotices = List.from(sampleNoticeJson)
    ..sort((a, b) => DateTime.parse(b['date']).compareTo(DateTime.parse(a['date'])));

  //
  // @override
  // void initState() {
  //   super.initState();
  //   _loadNotices();
  //   _startAutoRefresh();
  // }
  //
  // void _startAutoRefresh() {
  //   _timer?.cancel();
  //   _timer = Timer.periodic(const Duration(minutes: 3), (_) {
  //     _loadNotices(); // 3분마다 새로 불러옴
  //   });
  // }
  //
  // @override
  // void dispose() {
  //   _timer?.cancel(); // 화면 닫힐 때 타이머 종료
  //   super.dispose();
  // }
  //
  // ///final data = await MongoDBService.getNotices();
  // ///      setState(() => notices = data)
  // Future<void> _loadNotices() async {
  //   await Future.delayed(const Duration(milliseconds: 100));
  //   setState(() => notices = sampleNotices);
  // }

  bool loading = true;
  int page = 1;
  List<DataModel> notices = [];
  int totalResults = 0;
  ScrollController scrollController = ScrollController();

  Future<void> getData() async {
    if (!loading) {
      loading = true;
      setState(() {});
    }

    await Future.delayed(const Duration(milliseconds: 300));


    //https://ssaia.onrender.com/api/data
    /*Uri uri = Uri(
      scheme: "https",
      host: "ssaia.onrender.com",
      path: "/api/data",
      // queryParameters: {
      // "q": "google",
      // "from": "2025-08-02",
      // "sortBy": "publishedAt",
      // "apiKey": "77cc7329ed474701bdd6144b679e1e54",
      // "pageSize": "20",
      // "page": page.toString(),
      // },
    );

    var response = await Dio().get(uri.toString());

    totalResults = response.data["totalResults"] ?? 0;

    List<DataModel> tempList = [];
    tempList = (response.data["data"] as Iterable)
        .map((e) => DataModel.fromJson(e))
        .toList();
    notices.addAll(tempList);
     */

    ///samplenotices -> notices
    final List<Map<String, dynamic>> tempNoticeJson = sampleNoticeJson;
    final List<DataModel> tempNotices = tempNoticeJson
        .map((noticeJson) {
      // contentAttachment 처리
      final attachments = (noticeJson['contentAttachment'] as List<dynamic>?)
          ?.map((e) => AttachmentData.fromJson(Map<String, dynamic>.from(e)))
          .toList() ??
          [];

      // contentTable 처리
      /*final tables = (noticeJson['contentTable'] as List<dynamic>?)
          ?.map((row) => TableRowData.fromJson(Map<String, dynamic>.from(row)))
          .toList() ??
          [];*/
      final tables = (noticeJson['contentTable'] as List<dynamic>?)
          ?.expand((table) => (table as List<dynamic>)
          .map((row) => TableRowData.fromJson(Map<String, dynamic>.from(
          row.map((key, value) => MapEntry(key.toString(), value))))))
          .toList() ??
          [];


      // contentImages 처리
      final images = (noticeJson['contentImages'] as List<dynamic>?)
          ?.map((e) => ImageData(url: e.toString()))
          .toList() ??
          [];

      // periods 처리
      final periods = (noticeJson['periods'] as List<dynamic>?)
          ?.map((e) => Period.fromJson(Map<String, dynamic>.from(e)))
          .toList() ??
          [];

      return DataModel(
        noticeJson['title'] ?? '제목 없음',
        noticeJson['link'] ?? '',
        noticeJson['date'] ?? '',
        noticeJson['contentText'] ?? '',
        attachments,
        tables,
        images,
        periods,
        noticeJson['site'] ?? '',
      );
    }).toList();

    notices.addAll(tempNotices);

    //print(notices[0]);
    //print(notices[1]);


    loading = false;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getData();
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   getData(); // 프레임 렌더링 후 데이터 로드
    // });
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        bool isBottom =
            scrollController.position.pixels ==
            scrollController.position.maxScrollExtent; //바닥까지 감?
        if (isBottom && totalResults > notices.length && !loading) {
          //갔고, 내용 더 있고, 로딩 끝남
          page++;
          getData();
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (loading && notices.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    return Scaffold(
      //appBar: AppBar(title: const Text('공지사항')),
      body: ListView.builder(
        itemCount: notices.length,
        itemBuilder: (context, i) {
          final n = notices[i];
          return ListTile(
            leading: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  switch (n.site) {
                    'cs' => Icons.code,
                    'ds' => Icons.bar_chart,
                    'sw' => Icons.developer_mode,
                    'co' => Icons.insert_chart,
                    _ => Icons.help,
                  },
                ),
                const SizedBox(width: 4),
                Text(
                  switch (n.site) {
                    'cs' => '컴퓨터과학전공',
                    'ds' => '데이터사이언스전공',
                    'sw' => 'SW중심대학사업단',
                    'co' => '빅데이터혁신융합대학사업단',
                    _ => '기타',
                  },
                ),
              ],
            ),
            title: Text(n.title),
            subtitle: Text(
              n.contentText.replaceAll('\n', ' '), // 줄바꿈을 공백으로 변환
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            trailing: Text(n.date),
            onTap: () =>
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => NoticeDetailScreen(
                      notice: n,
                      controller: widget.controller,
                      onCalendarRequested: widget.onCalendarRequested,
                    ),
                  ),
                ).then((value) {
                  if (value != null && value is int) {
                    setState(() {});
                  }
                }),
          );
        },
      ),
    );
  }
}
