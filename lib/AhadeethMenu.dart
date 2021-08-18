import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran/AhadeethContent.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:quran/appconfig.dart';

class AhadeethMenu extends StatefulWidget {
  static const routeName = 'SurahNames';

  @override
  _AhadeethMenuState createState() => _AhadeethMenuState();
}

class _AhadeethMenuState extends State<AhadeethMenu> {

  @override
  late appConfig provider;
  Widget build(BuildContext context) {
    provider=Provider.of<appConfig>(context);

    return Container(
      //constraints: BoxConstraints.expand(),
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                  provider.isDarkMode()
                  ? 'assets/images/bg.png'
                  : 'assets/images/bg3.png'),
              fit: BoxFit.fill)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Text(AppLocalizations.of(context)!.islami, style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 25, fontWeight: FontWeight.bold))),

            Center(child:
            Image(image: AssetImage('assets/icons/ahadeethPage.png'),alignment: Alignment.center, width: 200, height: 200,)
            ),

            Container(
              decoration: BoxDecoration(
                border: Border.all(
                    color: Theme.of(context).accentColor
                ),
              ),
              child:  Center(child: Text(AppLocalizations.of(context)!.hadeeth, style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 20, fontWeight: FontWeight.bold))),
            ),

            Expanded(child:
            Container(
              //alignment: AlignmentDirectional.centerEnd,
              decoration: BoxDecoration(
                border: Border.all(
                  color:Theme.of(context).accentColor,
                ),
              ),
              child:
              Expanded(
                child: Container(
                  alignment: AlignmentDirectional.centerEnd,
                  child: ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemCount: 10,
                      itemBuilder: (BuildContext context, int index){
                        return GestureDetector(
                            child:
                            Container(
                              padding: const EdgeInsets.all(4.0),
                              child: Center(child:
                              Text('${index+1} ' + AppLocalizations.of(context)!.hadeeth, style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 18, fontWeight: FontWeight.bold),)
                              ),
                            ),
                            onTap: () {
                              var route = new MaterialPageRoute(
                                builder: (BuildContext context) => AhadeethContent( hadeethNumber: (index+1)),
                              );
                              Navigator.of(context).push(route);
                            }
                          /*Navigator.pushNamed(context, surahContent.routeName, arguments: {index+1,names[index]})*/
                        );
                      }
                  ),
                ),
              ),
            )
            )
          ],
        ),
      ),
    );
  }
}