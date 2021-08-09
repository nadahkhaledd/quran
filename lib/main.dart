import 'package:flutter/material.dart';
import 'package:quran/surahContent.dart';

void main()
{
  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Cairo'),
      debugShowCheckedModeBanner: false,
      routes: {
        surahContent.routeName:(buildContext)=>surahContent(),
      },

      initialRoute: surahContent.routeName,
    );
  }
}
