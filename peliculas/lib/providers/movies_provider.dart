import 'dart:io';

import 'package:flutter/material.dart';
import 'package:peliculas/models/movie_model.dart';
import 'package:peliculas/models/now_playing_model.dart';
import 'package:peliculas/models/popular_model.dart';
import 'package:peliculas/models/response_model.dart';
import 'package:peliculas/providers/api_manager.dart';
import 'package:peliculas/utils/app_type.dart';

class MoviesProvider extends ChangeNotifier {
  final String _apiKey = 'f55ca9de0c2d8a4ebde2ba492194fe7b';
  final String _baseUrl = 'api.themoviedb.org';
  final String _language = 'es-ES';

  List<Movie> onDisplayMovies = [];
  List<Movie> onDisplayPopularMovies = [];

  MoviesProvider() {
    getOnDisplayMovies();
    getPopularMovies();
  }

  getOnDisplayMovies() async {
    final ServiceResponse response = await ApiManager.shared.request(
      baseUrl: _baseUrl,
      pathUrl: '3/movie/now_playing',
      uriParams: {
        'api_key': _apiKey,
        'language': _language,
        'page': '1',
      },
      type: HttpType.get,
    );
    if (response.code == HttpStatus.ok) {
      final nowPlayingResponse = NowPlayingModel.fromMap(response.data);
      onDisplayMovies = nowPlayingResponse.results;
    }
    notifyListeners();
  }

  getPopularMovies() async {
    final ServiceResponse response = await ApiManager.shared.request(
      baseUrl: _baseUrl,
      pathUrl: '3/movie/popular',
      uriParams: {
        'api_key': _apiKey,
        'language': _language,
        'page': '1',
      },
      type: HttpType.get,
    );
    if (response.code == HttpStatus.ok) {
      final nowPlayingResponse = PopularModel.fromMap(response.data);
      onDisplayPopularMovies = [...onDisplayPopularMovies, ...nowPlayingResponse.results];
    }
    notifyListeners();
  }
}
