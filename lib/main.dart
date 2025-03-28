import 'package:flutter/material.dart';

import 'features/Dashboard/home_page.dart';

void main() {
  //registerIFrame(); // تسجيل عنصر الـ iframe
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
 // const MyApp({Key? key}) : super(key: key);
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      navigatorKey: navigatorKey,
      home:   homePage(),
    );
  }
}
