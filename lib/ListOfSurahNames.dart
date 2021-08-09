import 'package:flutter/material.dart';

class ListOfSurahNames extends StatelessWidget {

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

          ],
        ),
      ),
    );
  }
}
