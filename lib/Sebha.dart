import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Sebha extends StatefulWidget  {
  static const routeName = 'Sebha';

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<Sebha> with TickerProviderStateMixin {
  late AnimationController _controller;
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
    return MaterialApp(
      home: Scaffold(

        body: Center(

          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bg3.png'),
                fit: BoxFit.cover,
              ),
            ),

            child: Container(
              margin: EdgeInsets.only(top: 100),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Stack(
                    alignment: Alignment.topCenter,

                    children: [

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            margin: EdgeInsets.only(bottom:100),
                            //alignment: Alignment.topRight,
                            child: Image(

                              // alignment:Alignment.topCenter,
                              image:AssetImage('assets/icons/head of seb7a.png') ,)),
                      ),
                      Container(
                        //     margin: EdgeInsets.only(bottom: 200),
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
                            width: 150,
                            height: 150,
                          ),


                        ),
                      ),
                    ],
                  ),



                  Container(child: Text("عدد التسبيحات",style: TextStyle(fontSize: 30),)),
                  Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: new BorderRadius.circular(10.0),
                        color: Colors.brown[200],

                      ),
                      width: 50,
                      height: 50,
                      child: Text(
                        add.toString(),style: TextStyle(fontSize: 30,),

                      )
                  ),
                  Container(
                    child: ElevatedButton.icon(

                      icon: Icon(
                        Icons.favorite,
                        color: Colors.pink,
                        size: 24.0,
                      ),

                      label: Text(value ,style: TextStyle(fontSize: 20),),
                      onPressed: adder,

                      style: ElevatedButton.styleFrom(
                        primary: Colors.brown[200],
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(10.0),
                        ),

                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
