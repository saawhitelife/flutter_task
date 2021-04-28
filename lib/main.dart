import 'package:flutter/material.dart';

import 'screens/inbox_screen.dart';
import 'services/service_locator.dart';

void main() {
  setupServices();
  runApp(
    MyApp(),
  );
}

///
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.pink,
          textTheme: TextTheme(
            headline1: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
            subtitle1: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            bodyText1: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
          )),
      home: InboxScreen(),
    );
  }
}
