import 'package:demo_ui/home_screen.dart';
import 'package:demo_ui/page/home.dart';
import 'package:flutter/material.dart';

import 'login_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      // home: LoginScreen(),
    );
  }
}
