import 'package:flutter/material.dart';


class NavigationBar extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  int selected=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        //iconSize: 10,
        backgroundColor: Colors.red,
        //elevation: 10,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset('images/radio_blue.png'),
            label: 'Calls',
          ),
          BottomNavigationBarItem(
            icon:Image.asset('images/sebha_blue.png'),
            label: 'Camera',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('images/Group 6.png'),
            label: 'Chats',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('images/quran.png'),
            label: 'Chats',
          ),
        ],
        //fixedColor: Colors.red,
        // backgroundColor: Colors.red,
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

