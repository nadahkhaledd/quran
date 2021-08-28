import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran/singleNavbarPages/navbar.dart';
import 'package:quran/tools/appconfig.dart';





class listeningIcons extends StatelessWidget {
  late IconData icon;
  late appConfig provider;
  late Function buttonAction;
  listeningIcons(this.icon, this.buttonAction, this.provider);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: IconButton(
        icon: Icon(icon,
          color: provider.isDarkMode()? Colors.yellow: Theme.of(context).bottomAppBarColor,
          size: 25,),
        onPressed: buttonAction(),
      ),
    );
  }
}
