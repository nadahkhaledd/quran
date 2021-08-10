import 'package:flutter/material.dart';
import 'package:quran/ListOfSurahNames.dart';
import 'package:quran/surahContent.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Cairo'),
      debugShowCheckedModeBanner: false,
      routes: {
        ListOfSurahNames.routeName: (buildContext)=>ListOfSurahNames(),
        surahContent.routeName:(buildContext)=>surahContent(),
      },

      initialRoute: ListOfSurahNames.routeName,
    );
  }
}
