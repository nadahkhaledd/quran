import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class surahContent extends StatefulWidget {
  static const routeName = 'surahContent';

  @override
  _surahContentState createState() => _surahContentState();
}

class _surahContentState extends State<surahContent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 30.0,bottom: 24.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      'إسلامي',
                      style: TextStyle(
                        fontSize: 38.0,
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
                  height: MediaQuery.of(context).size.height * .77,

                  child: Column(
                    children: [
                      Row(

                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Align(

                            alignment: Alignment.topCenter,
                            child: Text(

                              'Name name',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 28.0,
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
                            //scrollDirection: Axis.horizontal,
                            child: Text(
                              'dgashfabjfkghfbdanmfbuslhfbdsjlfs'
                                  'fdsghfgdshgfgfsdkhfklsdf'
                                  'fdshfvhfjsaldghfbhsdv'
                                  'bdshafvbsdvlsahgdvbsdv'
                                  'dbsiakjbclaJFGBAJK sldkvnspdov'
                                  'dsbjvblhvbslvkbslivhbsnkmvs'
                                  'vhsdvblsajghbvasbkjdvjalsf'
                                  'vbhalsbd;vkb;asmd vlkhgabsdjkvn'
                                  'vbjslgbvhjs dlvshb vnkjsvd'
                                  'vdgskhavh jbasvikjnsdkvlhajbdvlajkbdvkj'
                                  'dgashfabjfkghfbdanmfbuslhfbdsjlfs'
                                  'fdsghfgdshgfgfsdkhfklsdf'
                                  'fdshfvhfjsaldghfbhsdv'
                                  'bdshafvbsdvlsahgdvbsdv'
                                  'dbsiakjbclaJFGBAJK sldkvnspdov'
                                  'dsbjvblhvbslvkbslivhbsnkmvs'
                                  'vhsdvblsajghbvasbkjdvjalsf'
                                  'vbhalsbd;vkb;asmd vlkhgabsdjkvn'
                                  'vbjslgbvhjs dlvshb vnkjsvd'
                                  'vdgskhavh jbasvikjnsdkvlhajbdvlajkbdvkj'
                                  'dgashfabjfkghfbdanmfbuslhfbdsjlfs'
                                  'fdsghfgdshgfgfsdkhfklsdf'
                                  'fdshfvhfjsaldghfbhsdv'
                                  'bdshafvbsdvlsahgdvbsdv'
                                  'dbsiakjbclaJFGBAJK sldkvnspdov'

                                  'dsbjvblhvbslvkbslivhbsnkmvs'
                                  'dgashfabjfkghfbdanmfbuslhfbdsjlfs'
                                  'fdsghfgdshgfgfsdkhfklsdf'
                                  'fdshfvhfjsaldghfbhsdv'
                                  'bdshafvbsdvlsahgdvbsdv'
                                  'dbsiakjbclaJFGBAJK sldkvnspdov'

                                  'dsbjvblhvbslvkbslivhbsnkmvs'
                              ,
                              style: TextStyle(
                                fontSize: 15.0,
                              ),

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
              fit: BoxFit.cover,
          ),
        ),
      ),
      ),
    );

  }
}

/*String _readingSurahsName()
{

  return '';
}*/
