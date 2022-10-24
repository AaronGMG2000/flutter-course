import 'package:flutter/material.dart';
import 'package:peliculas/models/credits_model/cast.dart';
import 'package:peliculas/providers/providers.dart';
import 'package:provider/provider.dart';

class CastingCards extends StatelessWidget {
  final int movieId;
  const CastingCards({Key? key, required this.movieId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MoviesProvider moviesProvider =
        Provider.of<MoviesProvider>(context, listen: false);
    return FutureBuilder<List<Cast>>(
      future: moviesProvider.getMovieCast(movieId),
      builder: (_, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          final List<Cast> cast = snapshot.data;
          return Container(
            margin: const EdgeInsets.only(bottom: 30),
            width: double.infinity,
            height: 180,
            child: ListView.builder(
              itemCount: cast.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, int index) => _CastCard(cast: cast[index]),
            ),
          );
        }
        return Container(
          margin: const EdgeInsets.only(bottom: 30),
          width: double.infinity,
          height: 180,
          child: const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}

class _CastCard extends StatelessWidget {
  final Cast cast;
  const _CastCard({Key? key, required this.cast}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: 110,
      height: 100,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              placeholder: const AssetImage('assets/images/no-image.jpg'),
              image: NetworkImage(cast.fullProfilePath),
              height: 140,
              width: 100,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            cast.name!,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
