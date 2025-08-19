import 'package:flutter/material.dart';
// import 'package:flutter_apk_1/pages/login_page.dart';
import 'package:flutter_apk_1/pages/main_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          appBarTheme: const AppBarTheme(backgroundColor: Colors.blue)),
      home: const MainPage(),
    );
  }
}
