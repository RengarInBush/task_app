import 'package:flutter/material.dart';
import 'package:task_app/pages/listScreen.dart';
import 'package:task_app/pages/mainPage.dart';
void  main() => runApp(MaterialApp(
  theme: ThemeData(
    primaryColor: Colors.purple
  ),
  debugShowCheckedModeBanner: false,
  initialRoute: '/',
  routes: {
    '/':(context) => const MainPage(),
  }
));