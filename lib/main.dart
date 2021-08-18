import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:quran/appconfig.dart';
import 'package:quran/myThemeData.dart';
import 'package:quran/navbar.dart';
import 'package:quran/surahContent.dart';
import 'package:quran/Sebha.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext)=>appConfig(),///class name
      builder: (BuildContext,Widget){
        final provider=Provider.of<appConfig>(BuildContext);
        return MaterialApp(
            themeMode: provider.themeMode,
            darkTheme:MythemeData.darkTheme,
            theme:MythemeData.lightTheme,

            localizationsDelegates: [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: AppLocalizations.supportedLocales,
            locale: Locale.fromSubtags(languageCode: provider.currentLanguage),
            debugShowCheckedModeBanner: false,

            home:navbar()
        );
      },
    );

  }
}