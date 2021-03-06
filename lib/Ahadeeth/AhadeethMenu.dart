import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran/Ahadeeth/AhadeethContent.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:quran/tools/appconfig.dart';

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
                        fontFamily: 'ReemKufi'))),

            Center(child:
            Image(image: AssetImage('assets/icons/ahadeethPage.png'),alignment: Alignment.center, width: 150, height: 150,)
            ),

            Container(
              padding: const EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide( color: provider.isDarkMode()? Colors.yellow: Colors.brown),
                      bottom: BorderSide( color: provider.isDarkMode()? Colors.yellow: Colors.brown),
                  )
                //Border.all(color: Theme.of(context).accentColor),
              ),
              child:  Center(
                  child: Text(AppLocalizations.of(context)!.hadeeth,
                      style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 17, fontWeight: FontWeight.bold, fontFamily: 'ReemKufi'))),
            ),

            Expanded(
              child: Container(
                alignment: AlignmentDirectional.centerEnd,
                child: ListView.builder(
                    padding: const EdgeInsets.all(10),
                    itemCount: 10,
                    itemBuilder: (BuildContext context, int index){
                      return GestureDetector(
                          child:
                          Container(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(child:
                            Text( provider.isEnglish()? 'Hadeeth No.${index+1}' : ' ???????? ?????? ${index+1} ',
                             style: TextStyle(color: Theme.of(context).primaryColor,
                                 fontSize: 18, fontWeight: FontWeight.bold,fontFamily: 'ReemKufi'),)
                            ),
                          ),
                          onTap: () {
                            var route = new MaterialPageRoute(
                              builder: (BuildContext context) => AhadeethContent( hadeethNumber: (index+1)),
                            );
                            Navigator.of(context).push(route);
                          });
                    }
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}