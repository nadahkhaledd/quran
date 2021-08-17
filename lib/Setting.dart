import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:quran/appconfig.dart';


class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  late appConfig provider ; //= Provider.of<appConfig>();

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
                          provider.changeLanguage('ar');
                        },
                        child: Container(
                          color: Colors.transparent,
                          child: Text('العربية',style: TextStyle(fontSize: 32,color: Colors.black),),
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
                          provider.changeLanguage('en');
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
                          provider.toggleTheme();
                        },
                        child: Container(
                          color: Colors.transparent,
                          child: Text(AppLocalizations.of(context)!.light,style: TextStyle(fontSize: 32,color: provider.isDarkMode()? Colors.black:Colors.red),),
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
                          provider.toggleTheme();

                        },
                        child: Container(
                          color: Colors.transparent,
                          child: Text(AppLocalizations.of(context)!.dark,style: TextStyle(fontSize: 32,color: provider.isDarkMode()? Colors.red:Colors.black),),
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
    provider=Provider.of<appConfig>(context);

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
                  child: Text(AppLocalizations.of(context)!.language,style: TextStyle(fontSize: 32,color: Colors.black),),
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
                  child: Text(AppLocalizations.of(context)!.theme,style: TextStyle(fontSize: 32,color: Colors.black),),
                ),
              ),
            ),
          )
        ],

      ),
    );

  }
}
