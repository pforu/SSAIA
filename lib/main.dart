import 'package:flutter/material.dart';
import 'package:ssaiaforme/util/custom_scroll_behavior.dart';
import 'package:ssaiaforme/screen/main_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "SSAIA",
      theme: ThemeData(
          useMaterial3: false,
          primarySwatch: Colors.amber
      ),
      home: MainScreen(key: MainScreen.globalKey),
      scrollBehavior: CustomScrollBehavior(),
    );
  }
}