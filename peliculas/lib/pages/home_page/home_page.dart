import 'package:flutter/material.dart';
import 'package:peliculas/delegates/search_delegate.dart';
import 'package:peliculas/providers/providers.dart';
import 'package:peliculas/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Peliculas en cines')),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.search_outlined),
            onPressed: () =>
                showSearch(context: context, delegate: MovieSearchDelegate()),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CardWiper(movies: moviesProvider.onDisplayMovies),
            MovieSlider(
                movies: moviesProvider.onDisplayPopularMovies,
                title: 'Populares',
                onNextPage: () => moviesProvider.getPopularMovies()),
          ],
        ),
      ),
    );
  }
}
