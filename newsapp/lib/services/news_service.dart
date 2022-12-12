import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:newsapp/models/index.dart';
import 'package:http/http.dart' as http;

const _urlNews = 'https://newsapi.org/v2';
const _apikey = '03d65fcdfb97476cbe64fbd4eb751728';

class NewsService with ChangeNotifier {
  List<Article> headlines = [];
  String _selectedCategory = 'business';
  List<Category> categories = [
    Category(icon: FontAwesomeIcons.building, name: 'business'),
    Category(icon: FontAwesomeIcons.tv, name: 'entertainment'),
    Category(icon: FontAwesomeIcons.addressCard, name: 'general'),
    Category(icon: FontAwesomeIcons.headSideVirus, name: 'health'),
    Category(icon: FontAwesomeIcons.vials, name: 'science'),
    Category(icon: FontAwesomeIcons.volleyball, name: 'sports'),
    Category(icon: FontAwesomeIcons.memory, name: 'technology'),
  ];

  Map<String, List<Article>> categoryArticles = {};

  NewsService() {
    getTopHeadlines();
    for (var item in categories) {
      categoryArticles[item.name] = [];
    }
    getArticlesByCategory(_selectedCategory);
  }

  String get selectedCategory => _selectedCategory;

  set selectedCategory(String valor) {
    _selectedCategory = valor;
    getArticlesByCategory(valor);
  }

  List<Article> get getArticulosCategoriaSeleccionada =>
      categoryArticles[selectedCategory]!;

  Future getTopHeadlines() async {
    const url = '$_urlNews/top-headlines?country=us&apiKey=$_apikey';
    final resp = await http.get(Uri.parse(url));

    final newsResponse = News.fromJson(resp.body);
    headlines.addAll(newsResponse.articles);
    notifyListeners();
  }

  Future getArticlesByCategory(String category) async {
    if (categoryArticles[category]!.isNotEmpty) {
      notifyListeners();
      return;
    }
    final url =
        '$_urlNews/top-headlines?country=us&apiKey=$_apikey&category=$category';
    final resp = await http.get(Uri.parse(url));

    final newsResponse = News.fromJson(resp.body);
    categoryArticles[category]!.addAll(newsResponse.articles);
    notifyListeners();
  }
}
