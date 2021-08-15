import 'package:flutter/material.dart';
import 'package:quran/AhadeethMenu.dart';
import 'ListOfSurahNames.dart';
import 'surahContent.dart';
import 'Sebha.dart';

class navbar extends StatefulWidget {

  @override
  navbarState createState() => navbarState();
}

class navbarState extends State<navbar> {
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
      AhadeethMenu(),
      ListOfSurahNames(),
    ];

    return Scaffold(
        body: Center(
          child: _pages.elementAt(selected), //New
        ),
      bottomNavigationBar:BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.brown,
        iconSize: 10,
        items: [
          BottomNavigationBarItem(
            activeIcon: new SizedBox(height: 30,child: Image.asset('assets/icons/radio_blue.png',color: Colors.black,),),
            icon: new SizedBox(height:20 ,child: Image.asset('assets/icons/radio_blue.png'),),
            label: 'الراديو',
          ),
          BottomNavigationBarItem(
            activeIcon: new SizedBox(height: 30,child: Image.asset('assets/icons/sebha_blue.png',color: Colors.black,),),
            icon:new SizedBox(height: 20,child: Image.asset('assets/icons/sebha_blue.png'),),
            label: 'التسبيح',
          ),
          BottomNavigationBarItem(
            activeIcon: new SizedBox(height: 30,child: Image.asset('assets/icons/Group 6.png',color: Colors.black,),),
            icon: new SizedBox(height:20 ,child: Image.asset('assets/icons/Group 6.png'),),
            label: 'الاحاديث',
          ),
          BottomNavigationBarItem(
            activeIcon: new SizedBox(height: 30,child: Image.asset('assets/icons/quran.png',color: Colors.black,),),
            icon: new SizedBox(height: 20,child: Image.asset('assets/icons/quran.png',),),
            label: 'القرآن',
          ),
        ],
        fixedColor: Colors.black,
        currentIndex: selected,
        showUnselectedLabels: false,
        onTap: IconTap,

      ),

    );
  }
}