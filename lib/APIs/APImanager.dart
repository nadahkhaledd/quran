import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:quran/model/RadioResponse.dart';

Future<RadioResponse> getRadios(String language) async {
  language = language=='en'?'english':'arabic';
  final uri = Uri.https("api.mp3quran.net", "/radios/radio_" + language + ".json");
  final response = await http.get(uri);
  print(response.body);
  if (response.statusCode == 200) {
    return RadioResponse.fromJson(jsonDecode(response.body));
  } else {
    throw Exception(response.body);
  }
}
