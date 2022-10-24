import 'package:peliculas/models/credits_model/crew.dart';

import 'cast.dart';

class CreditsModel {
  int? id;
  List<Cast>? cast;
  List<Crew>? crew;

  CreditsModel({this.id, this.cast, this.crew});

  factory CreditsModel.fromJson(Map<String, dynamic> json) => CreditsModel(
        id: json['id'] as int?,
        cast: (json['cast'] as List<dynamic>?)?.map((e) => Cast.fromJson(e as Map<String, dynamic>)).toList(),
        crew: (json['crew'] as List<dynamic>?)?.map((e) => Crew.fromJson(e as Map<String, dynamic>)).toList(),
      );
}
