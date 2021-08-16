import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran/ListOfSurahNames.dart';
import 'package:quran/appconfig.dart';
import 'package:quran/myThemeData.dart';
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
    return ChangeNotifierProvider(
      create: (BuildContext)=>appConfig(),///class name
      builder: (BuildContext,Widget){
        final provider=Provider.of<appConfig>(BuildContext);
        return MaterialApp(
            themeMode: ThemeMode.dark,
            darkTheme:MythemeData.darkTheme,
            theme:MythemeData.lightTheme,
            /*   theme: ThemeData(
        fontFamily: 'Cairo',

      ),*/
            debugShowCheckedModeBanner: false,

      home:navbar()
    );
  }
}