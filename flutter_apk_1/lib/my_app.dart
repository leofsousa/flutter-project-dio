import 'package:flutter/material.dart';
import 'package:flutter_apk_1/pages/login_page.dart';

import 'pages/main_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        appBarTheme: const AppBarTheme(
          color: Colors.red
        )
      ),
      home: const LoginPage(),
    );
  }
}