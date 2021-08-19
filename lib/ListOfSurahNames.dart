import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran/appconfig.dart';
import 'package:quran/surahContent.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/services.dart' show rootBundle;

class ListOfSurahNames extends StatefulWidget {
  static const routeName = 'SurahNames';

  @override
  _ListOfSurahNamesState createState() => _ListOfSurahNamesState();
}

class _ListOfSurahNamesState extends State<ListOfSurahNames> {
  late List<String> names = [
    'الفاتحة',
    'البقرة',
    'آل عمران',
    'النساء',
    'المائدة',
    'الانعام',
    'الاعراف',
    'الانفال',
    'التوبة',
    'يونس',
    'هود',
    'يوسف',
    'الرعد',
    'ابراهيم',
    'الحجر',
    'النحل',
    'الاسراء',
    'الكهف',
    'مريم',
    'طه',
    'الأنبياء',
    'الحج',
    'المؤمنون',
    'النور',
  ];
  late List<String> AyatNumbers = [
    '7',
    '286',
    '200',
    '176',
    '120',
    '165',
    '206',
    '75',
    '129',
    '109',
    '123',
    '111',
    '43',
    '52',
    '99',
    '128',
    '111',
    '110',
    '98',
    '135',
    '112',
    '78',
    '118',
    '64',
    '77',
    '227',
    '93',
    '88',
    '69',
    '60',
    '34',
    '30',
    '73',
    '54',
    '45',
    '83',
    '182',
    '88',
    '75',
    '85',
    '54',
    '53',
    '89',
    '59',
    '37',
    '35',
    '38',
    '29',
    '18',
    '45',
    '60',
    '49',
    '62',
    '55',
    '78',
    '96',
    '29',
    '22',
    '24',
    '13',
    '14',
    '11',
    '11',
    '18',
    '12',
    '12',
    '30',
    '52',
    '52',
    '44',
    '28',
    '28',
    '20',
    '56',
    '40',
    '31',
    '50',
    '40',
    '46',
    '42',
    '29',
    '19',
    '36',
    '25',
    '22',
    '17',
    '19',
    '26',
    '30',
    '20',
    '15',
    '21',
    '11',
    '8',
    '5',
    '19',
    '5',
    '8',
    '8',
    '11',
    '11',
    '8',
    '3',
    '9',
    '5',
    '4',
    '6',
    '3',
    '6',
    '3',
    '5',
    '4',
    '5',
    '6'
  ];

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

            Center(
                child: Image(
              image: AssetImage('assets/icons/Screenshot.png'),
              alignment: Alignment.center,
              width: 135,
              height: 135,
            )),

            Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide( color: Theme.of(context).accentColor),
                    bottom: BorderSide( color: Theme.of(context).accentColor),
                )
                //Border.all(color: Theme.of(context).accentColor),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(5.0),
                      alignment: AlignmentDirectional.centerStart,
                      child: Center(
                        child: Text(AppLocalizations.of(context)!.verses,
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'ElMessiri')),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(5.0),
                      alignment: AlignmentDirectional.centerStart,
                      child: Center(
                        child: Text(AppLocalizations.of(context)!.surahName,
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'ElMessiri')),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                alignment: AlignmentDirectional.centerEnd,
                child: ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: names.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                          child: Container(
                            padding: const EdgeInsets.all(4.0),
                            alignment: AlignmentDirectional.bottomEnd,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Expanded(
                                    child: Center(
                                      child: Text(
                                  AyatNumbers[index],
                                  style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'ElMessiri'),
                                ),
                                    )),
                                Expanded(
                                    child: Container(
                                      decoration: provider.isEnglish()? (BoxDecoration(
                                          border: Border(
                                            left: BorderSide( color: Theme.of(context).accentColor),
                                          )
                                      )): (BoxDecoration(
                                          border: Border(
                                            right: BorderSide( color: Theme.of(context).accentColor),
                                          )
                                      )),
                                      child: Center(
                                        child: Text(names[index],
                                            style: TextStyle(
                                                color:
                                                    Theme.of(context).primaryColor,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'ElMessiri')),
                                      ),
                                    )),
                              ],
                            ),
                          ),
                          onTap: () {
                            var route = new MaterialPageRoute(
                              builder: (BuildContext context) => surahContent(
                                surahName: names[index],
                                surahNumber: (index + 1),
                              ),
                            );
                            Navigator.of(context).push(route);
                          });
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
