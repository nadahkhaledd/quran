import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:async';
import 'package:quran/navbar.dart';
import 'appconfig.dart';

class AhadeethContent extends StatefulWidget {
  late int hadeethNumber;
  late appConfig provider;

  static const routeName = 'AhadeethContent';

  AhadeethContent({this.hadeethNumber = 1}) : super();

  @override
  _AhadeethContentState createState() => _AhadeethContentState();
}

class _AhadeethContentState extends State<AhadeethContent> {
  late Future _future;

  late String finalAhadeethContent = '';

  // This function is triggered when the user presses the icon button -temporarily-
  Future<void> _loadData(int surahNumber) async {
    final _loadedData = await rootBundle
        .loadString('assets/ahadeeth/' + surahNumber.toString() + '.txt');
    setState(() {
      finalAhadeethContent = _loadedData;
    });
    //print(_data);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadData(widget.hadeethNumber);
  }

  late appConfig provider;
  @override
  Widget build(BuildContext context) {
    provider=Provider.of<appConfig>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 35.0, bottom: 24.0),
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
                          color:Theme.of(context).primaryColor,
                          size: 35.0,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
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
                height: 25.0,
              ),
              Container(
                padding: EdgeInsets.only(top: 24.0, right: 18.0, left: 18.0),
                width: MediaQuery.of(context).size.width /1.3,
                height: MediaQuery.of(context).size.height /1.2,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: Text(
                            '${widget.hadeethNumber} ' + AppLocalizations.of(context)!.hadeeth ,
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
                      color: Colors.brown,
                    ),
                    Expanded(
                      child: Container(
                        child: finalAhadeethContent =='' ?Center(
                          child: CircularProgressIndicator(),
                        ):ListView.builder(
                          shrinkWrap: true,
                          itemCount: 1,
                          itemBuilder: (context, index) {
                            return
                              Text(finalAhadeethContent, style: TextStyle(color:Theme.of(context).accentColor), textAlign: TextAlign.end,);
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
