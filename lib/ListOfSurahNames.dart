
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:io';

class ListOfSurahNames extends StatelessWidget {

  late List<String> names = ['الفاتحة', 'البقرة', 'ال عمران', 'النساء', 'المائدة', 'الأنعام', 'الأعراف',
    'الأنفال', 'التوبة', 'يونس', 'هود', 'يوسف', 'الرعد', 'إبراهيم', 'الحجر', 'النحل', 'الاسراء', 'الكهف', 'مريم', 'طه'];

  ListOfSurahNames()
  {
    //LoadNames();
  }


  void LoadNames()
  {
    File f =  File('assets/Names.txt');
     names = f.readAsLinesSync();
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

              Center(child: Image(image: AssetImage('assets/icons/Screenshot.png'),alignment: Alignment.center, width: 135, height: 155,)),

            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.yellow,
                ),
              ),
              child: Expanded(
                child: Container(
                  padding: const EdgeInsets.all(5.0),
                  alignment: AlignmentDirectional.centerEnd,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.yellow,
                    ),
                  ),
                  child:  Text('السورة', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold)),
                ),
              ),
            ),

            Expanded(child:
              Container(
                //alignment: AlignmentDirectional.centerEnd,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.yellow,
                  ),
                ),
                child: ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: names.length,
                    itemBuilder: (BuildContext context, int index){
                      return GestureDetector(
                          child:
                          Container(
                            padding: const EdgeInsets.all(4.0),
                            alignment: AlignmentDirectional.centerEnd,
                            child: Text(names[index], style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),),
                          ),
                      onTap: () => print('$index')
                      );
                    }
                ),
              )
            )
          ],
        ),
      ),
    );
  }
}


