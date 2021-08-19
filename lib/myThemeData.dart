import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class MythemeData{
 static  final lightTheme=ThemeData(
primaryColor: Colors.black,
   bottomAppBarColor: Colors.brown,
   accentColor: Colors.black,
   secondaryHeaderColor:Colors.white,

 );

 static  final darkTheme=ThemeData(
   primaryColor: Colors.white,
   bottomAppBarColor: Color(0xFF141A2E),
   accentColor: Color(0xFFFBC927),
   secondaryHeaderColor:Color(0xFF141A2E),

 );

}