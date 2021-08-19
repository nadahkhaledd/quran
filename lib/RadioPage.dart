import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran/appconfig.dart';
import 'package:quran/surahContent.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/services.dart' show rootBundle;

class RadioPage extends StatefulWidget {
  static const routeName = 'RadioPage';
  @override
  _RadioPageState createState() => _RadioPageState();
}

class _RadioPageState extends State<RadioPage> {

  late appConfig provider;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<appConfig>(context);

    return Container(
      //constraints: BoxConstraints.expand(),
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(provider.isDarkMode()
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
                        fontFamily: 'ElMessiri'))),

            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Center(
                  child: Image(
                    image: AssetImage('assets/icons/radio.png'),
                    alignment: Alignment.center,
                    width: 350,
                    height: 260,
                  )),
            ),

            Center(
              child: Expanded(
                child: Text('إذاعة القرآن الكريم',
                    style: TextStyle(color: provider.isDarkMode()? Colors.white: Colors.black ,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        fontFamily: 'ElMessiri')),
              )
            ),

            Row(

              children: [
                Expanded(
                  child: IconButton(
                      icon: Icon(CupertinoIcons.backward_end_fill,
                        color: provider.isDarkMode()? Colors.yellow: Theme.of(context).bottomAppBarColor,
                      size: 25,),
                    onPressed: null,
                  ),
                ),
                Expanded(
                    child: IconButton(
                      icon: Icon(CupertinoIcons.arrowtriangle_right_fill,
                        color: provider.isDarkMode()? Colors.yellow: Theme.of(context).bottomAppBarColor,
                        size: 28,),
                      onPressed: null,
                    ),
                ),
                Expanded(
                  child: IconButton(
                    icon: Icon(CupertinoIcons.forward_end_fill,
                      color: provider.isDarkMode()? Colors.yellow: Theme.of(context).bottomAppBarColor,
                      size: 25,),
                    onPressed: null,
                  ),
                )
              ],
            )

          ],
        ),
      ),
    );
  }
}
