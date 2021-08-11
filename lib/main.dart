import 'package:flutter/material.dart';
import 'package:quran/ListOfSurahNames.dart';
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
  int selected=0;

  void IconTap(int index)
  {
    setState(() {
      selected=index;

    });

  }

  tempPages()
  {
    return Container(
      //constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/bg3.png"),
                fit: BoxFit.fill)
        ));
  }

  @override
  Widget build(BuildContext context) {

    List<Widget> _pages = <Widget>[
      tempPages(),
      Sebha(),
      tempPages(),
      ListOfSurahNames(),
      surahContent()
    ];
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Cairo'),
      debugShowCheckedModeBanner: false,

        home: Scaffold(
        body: Center(
          child: _pages.elementAt(selected), //New
        ),
          bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.brown,
              items: [
              BottomNavigationBarItem(
              activeIcon: Image.asset('assets/icons/radio_blue.png',color: Colors.black,),
              icon: Image.asset('assets/icons/radio_blue.png'),
              label: 'الراديو',
              ),
              BottomNavigationBarItem(
              activeIcon: Image.asset('assets/icons/sebha_blue.png',color: Colors.black,),
              icon:Image.asset('assets/icons/sebha_blue.png'),
              label: 'التسبيح',
              ),
              BottomNavigationBarItem(
              activeIcon: Image.asset('assets/icons/Group 6.png',color: Colors.black,),
              icon: Image.asset('assets/icons/Group 6.png'),
              label: 'الاحاديث',
              ),
              BottomNavigationBarItem(
              activeIcon: Image.asset('assets/icons/quran.png',color: Colors.black,),
              icon: Image.asset('assets/icons/quran.png',),
              label: 'القرآن',
              ),
              ],
              fixedColor: Colors.black,
              currentIndex: selected,
              showUnselectedLabels: false,
              onTap: IconTap,

              ),
              ),
    );
  }
}
