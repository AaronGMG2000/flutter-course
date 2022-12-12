import 'package:flutter/material.dart';
import 'package:newsapp/models/category_model.dart';
import 'package:newsapp/services/index.dart';
import 'package:newsapp/theme/theme.dart';
import 'package:newsapp/widgets/list_news.dart';
import 'package:provider/provider.dart';
import 'package:newsapp/utils/extensions.dart';

class Tab2Page extends StatelessWidget {
  const Tab2Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final noticias =
        Provider.of<NewsService>(context).getArticulosCategoriaSeleccionada;
    return SafeArea(
      child: Scaffold(
          body: Column(
        children: [
          const _ListaCategorias(),
          Expanded(child: ListNews(noticias: noticias)),
        ],
      )),
    );
  }
}

class _ListaCategorias extends StatelessWidget {
  const _ListaCategorias({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categories = Provider.of<NewsService>(context).categories;
    return SizedBox(
      height: 80,
      width: double.infinity,
      child: ListView.builder(
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                _CategoryButton(category: categories[index]),
                const SizedBox(height: 5),
                Text(categories[index].name.toCapitalized(),
                    style: const TextStyle(color: Colors.white)),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _CategoryButton extends StatelessWidget {
  const _CategoryButton({Key? key, required this.category}) : super(key: key);

  final Category category;

  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsService>(context);
    bool isSelected = newsService.selectedCategory == category.name;
    return GestureDetector(
      onTap: () {
        newsService.selectedCategory = category.name;
      },
      child: Container(
        width: 40,
        height: 40,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        child: Icon(category.icon,
            color: isSelected ? myTheme.colorScheme.secondary : Colors.black54),
      ),
    );
  }
}
