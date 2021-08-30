import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran/singleNavbarPages/navbar.dart';
import 'package:quran/tools/appconfig.dart';

class listeningIcons extends StatefulWidget {
  late IconData icon;
  late appConfig provider;
  late Function buttonAction;
  listeningIcons(this.icon, this.buttonAction);

  @override
  _listeningIconsState createState() => _listeningIconsState();
}

class _listeningIconsState extends State<listeningIcons> {
  @override
  Widget build(BuildContext context) {
    widget.provider = Provider.of<appConfig>(context);
    return Expanded(
      child: IconButton(
        icon: Icon(widget.icon,
          color: widget.provider.isDarkMode()? Colors.yellow: Theme.of(context).bottomAppBarColor,
          size: 25,),
        onPressed:()
        {
          widget.buttonAction();
        }
      ),
    );
  }
}
