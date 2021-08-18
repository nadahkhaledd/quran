import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart' show rootBundle;
import 'package:provider/provider.dart';
import 'package:quran/ListOfSurahNames.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'dart:async';

import 'package:quran/navbar.dart';

import 'appconfig.dart';

class surahContent extends StatefulWidget {
  String surahName = "surah name";
  late int surahNumber;

  static const routeName = 'surahContent';

  surahContent({this.surahName = 'surah name', this.surahNumber = 1}) : super();

  @override
  _surahContentState createState() => _surahContentState();
}

class _surahContentState extends State<surahContent> {
  late Future _future;

  String _data = '';

  int ayahNumber = 1;
   int surahLength = 0;

  late List<String> surahReadedContet = [];
  late List<String> finalSurahContent = [];

  // This function is triggered when the user presses the icon button -temporarily-
  Future<void> _loadData(int surahNumber) async {
    final _loadedData = await rootBundle
        .loadString('assets/ayat/' + surahNumber.toString() + '.txt');
      _data = _loadedData;
    });
    surahReadedContet = _data.split('\n');
  }

 //this function adds the numbering to the surah
  void _writingSurahInProperForm() async {
    await _loadData(widget.surahNumber);

    for (int i = 0; i < surahReadedContet.length; i++) {
      finalSurahContent
          .add(surahReadedContet[i] + '[' + ayahNumber.toString() + ']');
      ayahNumber++;
    }
    ayahNumber = 1;
    setState(() {
      surahLength = finalSurahContent.length;

    });
  }
  late appConfig provider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _writingSurahInProperForm();
  }
  @override
  Widget build(BuildContext context) {
    provider=Provider.of<appConfig>(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 25.0, bottom: 24.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(right: 5.0),
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_back_sharp,
                          color:Theme.of(context).accentColor,
                          size: 35.0,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => navbar(),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                   Container(
                    padding: EdgeInsets.only(left: 90.0, right: 135.0),
                    child: Text(
                      AppLocalizations.of(context)!.islami,
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 35.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30.0,
              ),
              Container(
                padding: EdgeInsets.only(top: 24.0, right: 18.0, left: 18.0),
                width: MediaQuery.of(context).size.width * .85,
                height: MediaQuery.of(context).size.height * .82,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: Text(
                            AppLocalizations.of(context)!.surah +' ' + widget.surahName ,

                            style: TextStyle(
                              color: Theme.of(context).accentColor,
                              fontWeight: FontWeight.w900,
                              fontSize: 25.0,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 32.0,
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: IconButton(
                            icon: Icon(
                              CupertinoIcons.arrowtriangle_right_circle_fill,
                              size: 30.0,
                              color:Theme.of(context).accentColor,
                            ),
                            onPressed: () {
                            },
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      indent: 18.0,
                      endIndent: 18.0,
                      thickness: 1.0,
                      color: Theme.of(context).accentColor,
                    ),
                    Expanded(
                      child: Container(
                        child: surahLength ==0 ?Center(
                          child: CircularProgressIndicator(),
                        ):ListView.builder(
                          shrinkWrap: true,
                          itemCount: finalSurahContent.length,
                          itemBuilder: (context, index) {
                            return
                              Text(finalSurahContent[index], style: TextStyle(color: Theme.of(context).accentColor), textAlign: TextAlign.end,);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
              ),
            ],
          ),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                  provider.isDarkMode()
                      ? 'assets/images/bg.png'
                      : 'assets/images/bg3.png'),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}