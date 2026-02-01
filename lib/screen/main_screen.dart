import 'package:flutter/material.dart';
import 'package:infinite_calendar_view/infinite_calendar_view.dart';
import 'package:ssaiaforme/screen/notice/notice_screen.dart';
import 'package:ssaiaforme/screen/calendar/calendar_screen.dart';

class MainScreen extends StatefulWidget {
  static final GlobalKey<_MainScreenState> globalKey = GlobalKey<_MainScreenState>();
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;
  final EventsController _calendarController = EventsController();

  void showCalendarTab() {
    setState(() {
      currentIndex = 1;
    });
  }

  @override
  Widget build(BuildContext context) {

    String appBarTitle = "";
    if (currentIndex == 0) {
      appBarTitle = "Notice";
    }
    else if (currentIndex == 1) {
      appBarTitle = "Calendar";
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle, style: TextStyle(color: Colors.black)),
      ),
      body: IndexedStack(
        index: currentIndex,
        children: [
          NoticeScreen(controller: _calendarController, onCalendarRequested: showCalendarTab,),
          CalendarScreen(controller: _calendarController),
        ],
      ),
      bottomNavigationBar: navigationBar(),
    );
  }

  BottomNavigationBar navigationBar() {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.feed_rounded), label: "공지사항"),
        BottomNavigationBarItem(icon: Icon(Icons.calendar_month), label: "캘린더",)
      ],
      currentIndex: currentIndex,
      onTap: (value) {
        currentIndex = value;
        setState(() {});
      },
    );
  }
}
