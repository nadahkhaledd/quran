import 'Radios.dart';

class RadioResponse {
  List<Radios> radios = [];

  RadioResponse({required List<Radios> radios}){
    radios = radios;
}

  RadioResponse.fromJson(dynamic json) {
    if (json['radios'] != null) {
      radios = [];
      json['radios'].forEach((v) {
        radios.add(Radios.fromJson(v));
      });
    }
  }
}

