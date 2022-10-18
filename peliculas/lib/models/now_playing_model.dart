import 'dart:convert';

import 'package:peliculas/models/movie_model.dart';

class NowPlayingModel {
  NowPlayingModel({
    required this.dates,
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  Dates dates;
  int page;
  List<Movie> results = [];
  int totalPages;
  int totalResults;

  factory NowPlayingModel.fromJson(String str) => NowPlayingModel.fromMap(json.decode(str));

  factory NowPlayingModel.fromMap(Map<String, dynamic> json) => NowPlayingModel(
        dates: Dates.fromMap(json["dates"]),
        page: json["page"],
        results: List<Movie>.from(json["results"].map((x) => Movie.fromMap(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );
}

class Dates {
  Dates({
    required this.maximum,
    required this.minimum,
  });

  DateTime maximum;
  DateTime minimum;

  factory Dates.fromJson(String str) => Dates.fromMap(json.decode(str));

  factory Dates.fromMap(Map<String, dynamic> json) => Dates(
        maximum: DateTime.parse(json["maximum"]),
        minimum: DateTime.parse(json["minimum"]),
      );
}
