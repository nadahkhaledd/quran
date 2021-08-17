import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart' show rootBundle;
import 'dart:async';

import 'package:quran/navbar.dart';

class AhadeethContent extends StatefulWidget {
  late int hadeethNumber;

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


  /*_writingSurahInProperForm() //this function adds the numbering to the surah
  {
    for (int i = 0; i < surahReadedContet.length; i++) {
      finalAhadeethContent.add(surahReadedContet[i]);
      finalAhadeethContent.add('[' + ayahNumber.toString() + ']');
      ayahNumber++;
    }
    ayahNumber = 1;
    surahLength = finalAhadeethContent.length;
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 25.0, bottom: 24.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.only(right: 5.0),
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back_sharp,
                        color:Theme.of(context).primaryColor,
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
                  Container(
                    padding: EdgeInsets.only(left: 90.0, right: 135.0),
                    child: Text(

                      'إسلامي',
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
                            '${widget.hadeethNumber} حديث ' ,
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
                              _loadData(widget.hadeethNumber);
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
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: SingleChildScrollView(
                          child: Column(
                            children: <Widget>[
                              ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: 1,
                                itemBuilder: (context, index) {
                                  return Text(finalAhadeethContent,style: TextStyle(color: Theme.of(context).accentColor),);
                                },
                              ),
                            ],
                          ),
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
              image: AssetImage('assets/images/bg3.png'),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}