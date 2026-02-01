// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:ssaiaforme/main.dart';

void main() {
  // Icon(Icons.computer)      // 컴퓨터과학전공
  // Icon(Icons.memory)        // 데이터사이언스전공
  // Icon(Icons.school)        // 학습 중심
  // Icon(Icons.business)      // 소프트웨어중심대학사업단
  // Icon(Icons.apartment)     // 빅데이터혁신융합대학사업단
  //
  // Icon(Icons.computer) // 컴퓨터과학
  // Icon(Icons.code)     // 데이터사이언스
  // Icon(Icons.school) // 학습/비교과
  // Icon(Icons.event)  // 활동
  // Icon(Icons.business)  // 사업단/기관
  // Icon(Icons.apartment) // 대학/조직
  //
  // Icon(Icons.computer)      // 일반 컴퓨터
  // Icon(Icons.desktop_mac)   // 데스크탑
  // Icon(Icons.memory)        // RAM/하드웨어
  // Icon(Icons.keyboard)      // 키보드
  // Icon(Icons.laptop)        // 노트북
  // Icon(Icons.smartphone)    // 모바일 기기
  // Icon(Icons.code)          // 코드
  // Icon(Icons.developer_mode) // 개발자 모드
  // Icon(Icons.bug_report)    // 디버깅/버그
  // Icon(Icons.storage)       // 데이터/저장소
  // Icon(Icons.cloud)         // 클라우드/서버
  // Icon(Icons.router)        // 라우터/네트워크
  // Icon(Icons.wifi)          // 무선 연결
  // Icon(Icons.public)        // 인터넷/웹
  // Icon(Icons.data_thresholding_outlined)
  //
  // Icon(Icons.storage)       // 데이터 저장소
  // Icon(Icons.cloud)         // 클라우드
  // Icon(Icons.cloud_queue)   // 클라우드 큐
  // Icon(Icons.cloud_done)    // 클라우드 완료
  // Icon(Icons.cloud_off)     // 클라우드 연결 끊김
  // Icon(Icons.folder)        // 폴더
  // Icon(Icons.folder_open)   // 폴더 열림
  // Icon(Icons.insert_drive_file) // 파일
  // Icon(Icons.insert_chart)  // 차트
  // Icon(Icons.bar_chart)     // 막대 차트
  // Icon(Icons.table_chart)   // 표/테이블
  // Icon(Icons.analytics)     // 데이터 분석
  // Icon(Icons.data_usage)    // 데이터 사용량
  // Icon(Icons.dataset)       // 데이터셋
  // Icon(Icons.storage_rounded) // 저장소(둥근 스타일)
  //
  // Icon(Icons.computer)         // 일반 컴퓨터
  // Icon(Icons.desktop_mac)      // 데스크탑
  // Icon(Icons.memory)           // RAM/하드웨어
  // Icon(Icons.laptop)           // 노트북
  // Icon(Icons.developer_mode)   // 개발자 모드
  // Icon(Icons.code)             // 코드
  //
  // Icon(Icons.keyboard)
  // Icon(Icons.mouse)
  // Icon(Icons.smart_display)
  // Icon(Icons.smartphone)
  // Icon(Icons.tablet)
  // Icon(Icons.desktop_windows)
  // Icon(Icons.code)
  // Icon(Icons.developer_mode)
  // Icon(Icons.bug_report)
  // Icon(Icons.settings)
  // Icon(Icons.storage)
  // Icon(Icons.cloud)
  // Icon(Icons.router)
  // Icon(Icons.wifi)
  // Icon(Icons.public)
  //
  // Icon(Icons.computer)
  // Icon(Icons.laptop) ///this
  // Icon(Icons.desktop_mac)
  // Icon(Icons.smart_display)
  // Icon(Icons.tablet)
  // Icon(Icons.smartphone)
  // Icon(Icons.memory)
  // Icon(Icons.router)
  // Icon(Icons.monitor) // 일부 Flutter 버전에서 지원
  // Icon(Icons.tv)      // 큰 화면 표시용
  //
  // Icon(Icons.bar_chart) ///this
  // Icon(Icons.insert_chart) ///this
  // Icon(Icons.pie_chart)
  // Icon(Icons.show_chart)
  // Icon(Icons.stacked_bar_chart)
  // Icon(Icons.scatter_plot) // 일부 Flutter 버전에서 지원
  // Icon(Icons.table_chart)
  // Icon(Icons.area_chart)    // 일부 Flutter 버전에서 지원
  // Icon(Icons.timeline)
  // Icon(Icons.trending_up)
  // Icon(Icons.trending_down)
  //
  // Icon(Icons.event)
  // Icon(Icons.event_available)
  // Icon(Icons.event_note)
  // Icon(Icons.event_busy)
  // Icon(Icons.schedule)
  // Icon(Icons.access_time)
  // Icon(Icons.today)
  // Icon(Icons.task)
  // Icon(Icons.assignment)
  // Icon(Icons.check_circle)
  // Icon(Icons.pending_actions)
  // Icon(Icons.flag)
  // Icon(Icons.notifications)
  // Icon(Icons.alarm)





  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    //await tester.pumpWidget(const MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
