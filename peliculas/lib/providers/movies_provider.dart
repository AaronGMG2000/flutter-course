import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:peliculas/helpers/debouncer.dart';
import 'package:peliculas/models/credits_model/credits_model.dart';
import 'package:peliculas/models/movie_model.dart';
import 'package:peliculas/models/now_playing_model.dart';
import 'package:peliculas/models/popular_model.dart';
import 'package:peliculas/models/response_model.dart';
import 'package:peliculas/models/search_model.dart';
import 'package:peliculas/providers/api_manager.dart';
import 'package:peliculas/utils/app_type.dart';

import '../models/cast.dart';

class MoviesProvider extends ChangeNotifier {
  final String _apiKey = 'f55ca9de0c2d8a4ebde2ba492194fe7b';
  final String _baseUrl = 'api.themoviedb.org';
  final String _language = 'es-ES';

  List<Movie> onDisplayMovies = [];
  List<Movie> onDisplayPopularMovies = [];
  Map<int, List<Cast>> moviesCast = {};
  int _popularPage = 0;

  final debouncer = Debouncer(duration: const Duration(milliseconds: 500));

  final StreamController<List<Movie>> _suggestionStreamController =
      StreamController.broadcast();
  Stream<List<Movie>> get suggestionStream =>
      _suggestionStreamController.stream;

  MoviesProvider() {
    getOnDisplayMovies();
    getPopularMovies();
  }

  getOnDisplayMovies([int page = 1]) async {
    final ServiceResponse response = await ApiManager.shared.request(
      baseUrl: _baseUrl,
      pathUrl: '3/movie/now_playing',
      uriParams: {
        'api_key': _apiKey,
        'language': _language,
        'page': '$page',
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
    _popularPage++;
    final ServiceResponse response = await ApiManager.shared.request(
      baseUrl: _baseUrl,
      pathUrl: '3/movie/popular',
      uriParams: {
        'api_key': _apiKey,
        'language': _language,
        'page': '$_popularPage',
      },
      type: HttpType.get,
    );
    if (response.code == HttpStatus.ok) {
      final nowPlayingResponse = PopularModel.fromMap(response.data);
      onDisplayPopularMovies = [
        ...onDisplayPopularMovies,
        ...nowPlayingResponse.results
      ];
    }
    notifyListeners();
  }

  Future<List<Cast>> getMovieCast(int movieId) async {
    if (moviesCast.containsKey(movieId)) return moviesCast[movieId]!;
    final ServiceResponse response = await ApiManager.shared.request(
      baseUrl: _baseUrl,
      pathUrl: '3/movie/$movieId/credits',
      uriParams: {
        'api_key': _apiKey,
        'language': _language,
      },
      type: HttpType.get,
    );
    if (response.code == HttpStatus.ok) {
      final creditsResponse = CreditsModel.fromJson(response.data);
      moviesCast[movieId] = creditsResponse.cast ?? [];
      return creditsResponse.cast ?? [];
    }
    return [];
  }

  Future<List<Movie>> searchMovies(String query) async {
    final ServiceResponse response = await ApiManager.shared.request(
      baseUrl: _baseUrl,
      pathUrl: '3/search/movie',
      uriParams: {
        'api_key': _apiKey,
        'language': _language,
        'query': query,
      },
      type: HttpType.get,
    );
    if (response.code == HttpStatus.ok) {
      final searchResponse = SearchModel.fromMap(response.data);
      return searchResponse.results;
    }
    return [];
  }

  void getSuggestionsByQuery(String searchTerm) {
    debouncer.value = '';
    debouncer.onValue = (value) async {
      final results = await searchMovies(value);
      _suggestionStreamController.add(results);
    };
    final timer = Timer.periodic(const Duration(milliseconds: 300), (_) {
      debouncer.value = searchTerm;
    });
    Future.delayed(const Duration(milliseconds: 301))
        .then((_) => timer.cancel());
  }
}
