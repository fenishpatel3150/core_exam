import 'package:core_exam/screen/adddatapage/datapage.dart';
import 'package:core_exam/screen/detailscreen/detailscreen.dart';
import 'package:core_exam/screen/homescreen/homescreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes:
      {
        '/':(context)=>Homescreen(),
        '/second':(context)=>detailscreen(),
        '/third':(context)=>Datapage(),
      },

    );
  }
}

