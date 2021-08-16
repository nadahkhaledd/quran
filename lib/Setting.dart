import 'package:flutter/material.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  void LanguageMenu()
  {

      showModalBottomSheet(
          context: context,
          builder: (buildContext){
            return Container(
              child:Column(
                children: [
                  Container(
                    margin:  EdgeInsets.only(top: 20,bottom: 20),
                    child: Material(
                      color: Colors.white.withOpacity(0.0),
                      child: InkWell(
                        onTap: (){
                        },
                        child: Container(
                          color: Colors.transparent,
                          child: Text('Arabic',style: TextStyle(fontSize: 32,color: Colors.black),),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    //margin:  EdgeInsets.only(top: 140,bottom: 80),
                    child: Material(
                      color: Colors.white.withOpacity(0.0),
                      child: InkWell(
                        onTap: (){
                        },
                        child: Container(
                          color: Colors.transparent,
                          child: Text('English',style: TextStyle(fontSize: 32,color: Colors.black),),
                        ),
                      ),
                    ),
                  ),
                ],
              )


            );
      });




  }
  void themeMenu()
  {

    showModalBottomSheet(
        context: context,
        builder: (buildContext){
          return Container(
              child:Column(
                children: [
                  Container(
                    margin:  EdgeInsets.only(top: 20,bottom: 20),
                    child: Material(
                      color: Colors.white.withOpacity(0.0),
                      child: InkWell(
                        onTap: (){
                        },
                        child: Container(
                          color: Colors.transparent,
                          child: Text('Light',style: TextStyle(fontSize: 32,color: Colors.black),),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    //margin:  EdgeInsets.only(top: 140,bottom: 80),
                    child: Material(
                      color: Colors.white.withOpacity(0.0),
                      child: InkWell(
                        onTap: (){
                        },
                        child: Container(
                          color: Colors.transparent,
                          child: Text('Dark',style: TextStyle(fontSize: 32,color: Colors.black),),
                        ),
                      ),
                    ),
                  ),
                ],
              )


          );
        });




  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
        image: DecorationImage(
        image: AssetImage("assets/images/bg3.png"),
    fit: BoxFit.fill)

    )
        ,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(

            margin: EdgeInsets.only(top: 140,bottom: 80,left:20,right: 100),
            child: Material(
              color: Colors.white.withOpacity(0.0),
              child: InkWell(
                onTap: (){
                      LanguageMenu();
                },
                child: Container(
                  color: Colors.transparent,
                  child: Text('language',style: TextStyle(fontSize: 32,color: Colors.black),),
                ),
              ),
            ),
          )
          ,
          Container(
            margin: EdgeInsets.only(left:20,right: 100),
            child: Material(
               color: Colors.white.withOpacity(0.0),
              child: InkWell(
                onTap: (){
                  themeMenu();
                },
                child: Container(
                  width: double.infinity,
                  color: Colors.transparent,
                  child: Text('theme',style: TextStyle(fontSize: 32,color: Colors.black),),
                ),
              ),
            ),
          )
        ],

      ),
    );

  }
}
