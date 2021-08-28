import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran/tools/appconfig.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Sebha extends StatefulWidget  {
  static const routeName = 'Sebha';

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<Sebha> with TickerProviderStateMixin {
  late AnimationController _controller;
  late appConfig provider;
  int add = 0;
  int swap = 0;
  String value = 'Start';
  void adder() {
    setState(() {
      _controller.forward();
      if (add == 0 && swap == 0) {
        add = 0;
        swap = 1;
      }
      if (add < 33&& swap == 1) {
        value = 'سبحان الله';
        add++;
      } else if (add == 33 && swap == 1) {
        add = 0;
        swap = 2;
        value = 'الحمدلله';
      } else if (add < 33 && swap == 2) {
        value = 'الحمدلله';
        add++;
      } else if (add == 33 && swap == 2) {
        add = 0;
        swap = 3;
        value = 'الله اكبر';

      } else if (add < 33 && swap == 3) {
        value = 'الله اكبر';
        add++;
      }
      else if (add == 33 && swap == 3) {
        add = 0;
        swap =4;
        value = 'استغفر الله العظيم';

      } else if (add < 33 && swap == 4) {
        value = 'استغفر الله العظيم';
        add++;
      }

      else {

        print(add);
        value = 'Start';
        add = 0;
        swap = 0;
      }
    });
  }

  @override
  void initState()
  {
    _controller =AnimationController(
      duration: Duration(milliseconds: 100),
      vsync: this,
    );
    super.initState();
  }
  @override
  void dispose()
  {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    provider=Provider.of<appConfig>(context);
    return  Container(
          decoration: BoxDecoration(
            image: DecorationImage(

              image: AssetImage(
                  provider.isDarkMode()
                      ? 'assets/images/bg.png'
                      : 'assets/images/bg3.png'
              ),
              fit: BoxFit.fill,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 35.0),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                    child: Text(AppLocalizations.of(context)!.islami,
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 27,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'ElMessiri'))),
                Container(
                   margin: EdgeInsets.only(top:30),
                    //alignment: Alignment.topRight,
                    child: Image(
                      height: 80, width: 80,
                      image:AssetImage('assets/icons/head of seb7a.png'))),
                   Container(
                    // margin: EdgeInsets.only(bottom:100),
                  //   alignment: Alignment.topCenter,
                     child: RotationTransition(
                       turns: Tween(begin: 0.0,end:1.0).animate(_controller)
                         ..addStatusListener((status) {
                           if(status==AnimationStatus.completed)
                           {
                             _controller.reverse();
                           }
                         }),
                       child: Image(
                         image: AssetImage('assets/icons/body of seb7a.png'),
                         width: 135,
                         height: 135,
                       ),
                     ),
                   ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(child: Text(AppLocalizations.of(context)!.tasbeehCount,style:
                  TextStyle(fontSize: 30,color: Theme.of(context).primaryColor, fontFamily: 'ElMessiri'),)
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: new BorderRadius.circular(10.0),
                        color:Theme.of(context).bottomAppBarColor,

                      ),
                      width: 50,
                      height: 50,
                      child: Text(
                        add.toString(),style: TextStyle(fontSize: 30,color: Theme.of(context).primaryColor, fontFamily: 'ElMessiri'),

                      )
                  ),
                ),

                Padding(
                  padding: EdgeInsets.all(8),
                  child: ElevatedButton(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(value ,style: TextStyle(fontSize: 20,color: Theme.of(context).primaryColor,fontFamily: 'ElMessiri'),),
                    ),
                    onPressed: adder,

                    style: ElevatedButton.styleFrom(
                        primary:Theme.of(context).bottomAppBarColor,
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(20.0),
                      ),

                    ),
                  ),
                )
              ],
            ),
          ),
    );
  }
}