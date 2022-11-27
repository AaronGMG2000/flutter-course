import 'package:google_maps_flutter/google_maps_flutter.dart';

class ScanModel {
  int? id;
  String type;
  String value;

  ScanModel({this.id, this.type = 'http', required this.value}) {
    if (value.contains('http')) {
      type = 'http';
    } else {
      type = 'geo';
    }
  }

  factory ScanModel.fromJson(Map<String, dynamic> json) => ScanModel(
        id: json["id"],
        type: json["type"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "value": value,
      };

  LatLng getLatLng() {
    final lalo = value.substring(4).split(',');
    final lat = double.parse(lalo[0]);
    final lng = double.parse(lalo[1]);
    return LatLng(lat, lng);
  }
}
