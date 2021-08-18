import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran/AhadeethMenu.dart';
import 'package:quran/Setting.dart';
import 'ListOfSurahNames.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'Sebha.dart';
import 'appconfig.dart';

class navbar extends StatefulWidget {

  @override
  navbarState createState() => navbarState();
}
late appConfig provider;

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
    provider = Provider.of<appConfig>(context);

    return Container(
      //constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(provider.isDarkMode()
                    ? 'assets/images/bg.png'
                    : 'assets/images/bg3.png'),
                fit: BoxFit.fill)
        ));
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _pages = <Widget>[
      Setting(),
      tempPages(),
      Sebha(),
      AhadeethMenu(),
      ListOfSurahNames(),
    ];

    return Scaffold(

      body:  Center(
          child: _pages.elementAt(selected), //New
        ),
      bottomNavigationBar:BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Theme.of(context).bottomAppBarColor,
        iconSize: 10,
        items: [
          BottomNavigationBarItem(
            activeIcon: new SizedBox(height: 30,child: Image.asset('assets/icons/setting.png',color: Theme.of(context).accentColor,),),
            icon: new SizedBox(height:20 ,child: Image.asset('assets/icons/setting.png'),),
            label: AppLocalizations.of(context)!.settings,
          ),
          BottomNavigationBarItem(
            activeIcon: new SizedBox(height: 30,child: Image.asset('assets/icons/radio_blue.png',color:Theme.of(context).accentColor,),),
            icon: new SizedBox(height:20 ,child: Image.asset('assets/icons/radio_blue.png'),),
            label: AppLocalizations.of(context)!.radio,
          ),
          BottomNavigationBarItem(
            activeIcon: new SizedBox(height: 30,child: Image.asset('assets/icons/sebha_blue.png',color: Theme.of(context).accentColor,),),
            icon:new SizedBox(height: 20,child: Image.asset('assets/icons/sebha_blue.png'),),
            label: AppLocalizations.of(context)!.tasbeeh,
          ),
          BottomNavigationBarItem(
            activeIcon: new SizedBox(height: 30,child: Image.asset('assets/icons/Group 6.png',color:Theme.of(context).accentColor,),),
            icon: new SizedBox(height:20 ,child: Image.asset('assets/icons/Group 6.png'),),
            label: AppLocalizations.of(context)!.hadeeth,
          ),
          BottomNavigationBarItem(
            activeIcon: new SizedBox(height: 30,child: Image.asset('assets/icons/quran.png',color:Theme.of(context).accentColor,),),
            icon: new SizedBox(height: 20,child: Image.asset('assets/icons/quran.png',),),
            label: AppLocalizations.of(context)!.quran,
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