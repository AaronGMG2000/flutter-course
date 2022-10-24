import 'package:flutter/material.dart';
import 'package:peliculas/providers/providers.dart';
import 'package:provider/provider.dart';

class MovieSearchDelegate extends SearchDelegate {
  @override
  String get searchFieldLabel => 'Buscar película';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () => query = '',
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back_ios),
      onPressed: () => close(context, null),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return const Center(
        child: Icon(Icons.movie_creation_outlined, color: Colors.black38, size: 150),
      );
    }
    final MoviesProvider moviesProvider = Provider.of<MoviesProvider>(context, listen: false);

    moviesProvider.getSuggestionsByQuery(query);

    return StreamBuilder(
        stream: moviesProvider.suggestionStream,
        builder: (_, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          final movies = snapshot.data as List;
          return ListView.builder(
              itemBuilder: (_, index) {
                movies[index].heroId = 'search-${movies[index].id}';
                return ListTile(
                  leading: Hero(
                    tag: movies[index].heroId!,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: FadeInImage(
                        placeholder: const AssetImage('assets/images/no-image.jpg'),
                        image: NetworkImage(movies[index].fullPosterImg),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  title: Text(movies[index].title),
                  subtitle: Text(movies[index].originalTitle),
                  onTap: () {
                    Navigator.pushNamed(context, 'details', arguments: movies[index]);
                  },
                );
              },
              itemCount: movies.length);
        });
  }
}
