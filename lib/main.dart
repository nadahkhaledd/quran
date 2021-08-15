import 'package:flutter/material.dart';
import 'package:quran/ListOfSurahNames.dart';
import 'package:quran/navbar.dart';
import 'package:quran/surahContent.dart';
import 'package:quran/Sebha.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      theme: ThemeData(fontFamily: 'Cairo'),
      debugShowCheckedModeBanner: false,

      home:navbar()
    );
  }
}