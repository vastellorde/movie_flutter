import 'package:flutter/material.dart';
import 'package:movie/features/movie/domain/models/movie.dart';
import 'package:movie/shared/widgets/tmdb_image/tmdb_image.dart';

class MovieItem extends StatelessWidget {
  const MovieItem({required this.movie, super.key});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TmdbImage(url: movie.posterPath),
          Padding(
            padding:
                const EdgeInsets.only(top: 10, left: 16, right: 16, bottom: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  movie.title,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  movie.releaseDate.toString(),
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
