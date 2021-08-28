import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran/APIs/APImanager.dart';
import 'package:quran/Radio/listeningIcons.dart';
import 'package:quran/model/RadioResponse.dart';
import 'package:quran/model/Radios.dart';
import 'package:quran/tools/appconfig.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RadioPage extends StatefulWidget {
  static const routeName = 'RadioPage';
  @override
  _RadioPageState createState() => _RadioPageState();
}

class _RadioPageState extends State<RadioPage> {
  late Future<RadioResponse> RadioFuture;
  late appConfig provider;
  late List<Radios> radios = [];
  late String channelName = 'Channel Name';
  int index = 0;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<appConfig>(context);
    RadioFuture = getRadios(provider.currentLanguage);

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

            Expanded(
              //padding: const EdgeInsets.all(8.0),
              child: FutureBuilder<RadioResponse>
                (
                future: RadioFuture,
                builder: (BuildContext, snapshot) {
                  if (snapshot.hasData) {
                    radios = snapshot.data!.radios;
                    print('from remote:' + snapshot.data!.radios.length.toString() + '\nfrom class: ' + radios.length.toString());
                    channelName = (radios!= null)?radios[index].name??' ':'Radio';
                    return Center(
                        child: Text(channelName,
                            style: TextStyle(color: provider.isDarkMode()
                                ? Colors.white
                                : Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                fontFamily: 'ElMessiri'))
                    );
                  }
                  else if (snapshot.hasError) {
                    return Text('Error');
                  }
                  else {
                    return Center(
                        child: CircularProgressIndicator(
                            color: Theme.of(context).bottomAppBarColor));
                  }
                },

              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  listeningIcons(CupertinoIcons.backward_end_fill, next_channel,provider),

                  listeningIcons(CupertinoIcons.arrowtriangle_right_fill, next_channel,provider),

                  listeningIcons(CupertinoIcons.forward_end_fill,next_channel,provider),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  next_channel()
  {
    setState(() {
      index+=1;
      channelName = (radios != [])?radios[index].name??' ': channelName;
    });
  }
}
