import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:quran/Storage.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:async';
import 'package:quran/tryingBackButton.dart';
import 'dart:io';





class surahContent extends StatefulWidget {

  static const routeName = 'surahContent';

  @override
  _surahContentState createState() => _surahContentState();
}

class _surahContentState extends State<surahContent> {
  late Future _future;

  String _data='';
  //late int surahNumber;
   int ayahNumber=1;
  late int surahLength=0;
   late List<String> surahReadedContet=[];
   late List<String> finalSurahContent=[];

  // This function is triggered when the user presses the icon button -temporarily-
  Future<void> _loadData(int surahNumber) async {
    final _loadedData = await rootBundle.loadString('assets/ayat/'+surahNumber.toString()+'.txt');
    setState(() {
      _data = _loadedData;

    });
    //print(_data);
    surahReadedContet=_data.split('\n');

  }
  void initState() {
    super.initState();
    _loadData(2);
    //Future.delayed(Duration.zero, () => _loadData(2));
  }

  /*void initState() {
    _future = _loadData(113);

    super.initState();
  }*/

  void _showSurahsContent()
  {
    for(int i =0;i<surahReadedContet.length;i++)
      {
        print(surahReadedContet[i]+'\n');
      }
  }

  void _writingSurahInProperForm()
  {
    for(int i=0;i<surahReadedContet.length;i++)
      {
        finalSurahContent.add(surahReadedContet[i]);
        finalSurahContent.add('['+ayahNumber.toString()+']');
        ayahNumber++;
      }
    ayahNumber=1;
    surahLength=finalSurahContent.length;

  }

  void _showSurahsContentInProperForm()
  {
    for(int i =0;i<finalSurahContent.length;i++)
    {
      print(finalSurahContent[i]+'\n');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(

          padding: EdgeInsets.only(top: 25.0,bottom: 24.0),
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
                        color: Colors.black,
                        size: 35.0,
                      ),
                      onPressed: (){
                        _loadData(2);
                        //_showSurahsContent();
                        _writingSurahInProperForm();
                       // _showSurahsContentInProperForm();
                      },
                        /*Navigator.push(context, MaterialPageRoute(builder: (context)=>tryingBachButton(),

                        ),
                        );*/

                    ),
                  ) ,

                   Container(
                     padding: EdgeInsets.only(left: 90.0,right: 135.0),
                     child: Text(

                        'إسلامي',
                        style: TextStyle(
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
                  padding: EdgeInsets.only(top: 24.0,right: 18.0,left: 18.0),
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
                              'surah name',
                              style: TextStyle(
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
                            child: Icon(
                              CupertinoIcons.arrowtriangle_right_circle,
                              size: 30.0,
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
                                    itemCount: surahLength,
                                    itemBuilder: (context, index) {
                                      //_loadData(2);
                                     // _writingSurahInProperForm();
                                      return Text(finalSurahContent[index]);
                                    },
                                  ),
                                ],
                              ),
                              /*FutureBuilder(
                                  future: _future,
                                  builder: (context, snapshot) =>
                                      Text(snapshot.hasData ? '${snapshot.data}' : ' Reading...')),*/

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


