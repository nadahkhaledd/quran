import 'package:flutter/material.dart';
import 'ListOfSurahNames.dart';

class NavigationBar extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  int selected=0;

  @override
  Widget build(BuildContext context) {
     List<Widget> _pages = <Widget>[
      ListOfSurahNames(),
       ListOfSurahNames(),
       ListOfSurahNames(),
       ListOfSurahNames(),
    ];
    return Scaffold(
      body: Center(
        child: _pages.elementAt(selected), //New
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.brown,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/radio_blue.png'),
            label: 'الراديو',
          ),
          BottomNavigationBarItem(
            icon:Image.asset('assets/icons/sebha_blue.png'),
            label: 'التسبيح',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/Group 6.png'),
            label: 'الاحاديث',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/quran.png'),
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

  void IconTap(int index)
  {
    setState(() {
      selected=index;
    });

  }
}

