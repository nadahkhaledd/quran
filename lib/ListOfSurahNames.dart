
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class ListOfSurahNames extends StatefulWidget {
  static const routeName = 'SurahNames';

  @override
  _ListOfSurahNamesState createState() => _ListOfSurahNamesState();
}

class _ListOfSurahNamesState extends State<ListOfSurahNames> {
  late List<String> names = [];
  late List<String> AyatNumbers = [];
  late String _dataOfNames = '';
  late String _dataOfNumbersOfAyat = '';

  Future<void> _loadData() async {
    final _loadedNames = await rootBundle.loadString('assets/Names.txt');
    final _loadedNumbers = await rootBundle.loadString('assets/NumbersOfAyat.txt');
    setState(() {
      _dataOfNames = _loadedNames;
      _dataOfNumbersOfAyat = _loadedNumbers;
    });
  }

  void LoadFiles()
  {
    _loadData();
      names = _dataOfNames.split('\n');
      AyatNumbers = _dataOfNumbersOfAyat.split('\n');
  }

  @override
  void initState() {
    super.initState();
    LoadFiles();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //constraints: BoxConstraints.expand(),
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/bg3.png"),
              fit: BoxFit.fill)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
              Center(child: Text('إسلامي', style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold))),

            GestureDetector(
              child: Center(child:
                    Image(image: AssetImage('assets/icons/Screenshot.png'),alignment: Alignment.center, width: 135, height: 155,)
                    ),
              onTap: LoadFiles,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.brown
                      ),
                    ),
                    child: Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(5.0),
                        alignment: AlignmentDirectional.centerEnd,
                        child:  Text('عدد الايات', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.brown,
                      ),
                    ),
                    child: Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(5.0),
                        alignment: AlignmentDirectional.centerEnd,
                        child:  Text('السورة', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            Expanded(child:
              Container(
                //alignment: AlignmentDirectional.centerEnd,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.brown,
                  ),
                ),
                child:
                Expanded(
                  child: Container(
                    alignment: AlignmentDirectional.centerEnd,
                    child: ListView.builder(
                        padding: const EdgeInsets.all(8),
                        itemCount: names.length,
                        itemBuilder: (BuildContext context, int index){
                          return GestureDetector(
                              child:
                              Container(
                                padding: const EdgeInsets.all(4.0),
                                alignment: AlignmentDirectional.centerEnd,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Expanded(child:
                                    Text(AyatNumbers[index], style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),)
                                      ),
                                    Expanded(child:
                                    Text(names[index], style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold))),
                                  ],
                                )
                              ),
                              onTap: () => print('$index')
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


