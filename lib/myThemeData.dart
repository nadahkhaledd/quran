import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class MythemeData{
 static  final lightTheme=ThemeData(
   //  scaffoldBackgroundColor:
   );
 static  final darkTheme=ThemeData(
  colorScheme:  ColorScheme.dark(),
   bottomNavigationBarTheme: BottomNavigationBarThemeData(
     //backgroundColor: Color.fromRGBO(20, 26, 46, 255),
     backgroundColor: Colors.red,
         type: BottomNavigationBarType.fixed,
   )
 );

}