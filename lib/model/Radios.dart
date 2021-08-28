class Radios {
  String ?name = '';
  String ?radioUrl = '';

  Radios(
    this.name,
    this.radioUrl);

  Radios.fromJson(dynamic json) {
    name = json['name'];
    radioUrl = json['radio_url'];
  }
}