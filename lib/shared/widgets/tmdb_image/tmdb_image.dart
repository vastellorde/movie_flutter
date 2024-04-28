import 'package:flutter/material.dart';

class TmdbImage extends StatelessWidget {
  const TmdbImage({required this.url, super.key});

  final String url;

  @override
  Widget build(BuildContext context) {
    final ratio = MediaQuery.devicePixelRatioOf(context);
    final newUrl = _createUrl(ratio);
    return Image.network(newUrl + url);
  }

  String _createUrl(double ratio) {
    if (ratio > 3) {
      return 'https://image.tmdb.org/t/p/w500';
    }
    return 'https://image.tmdb.org/t/p/w342';
  }
}
