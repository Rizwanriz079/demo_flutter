import 'package:demo/Screens/Homepage/Homepage.dart';
import 'package:demo/Screens/home2.dart';
import 'package:demo/Screens/login.dart';
import 'package:demo/Screens/splash.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      // initialRoute: '/',
      routes: {
        '/login': (context) => LoginPage(),
        '/Home2': (context) => Home2(),
      },
    );
  }
}
