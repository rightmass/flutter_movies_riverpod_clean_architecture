import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/movie.dart';
import '../../utils/constants.dart';

class MovieHorizontalList extends StatelessWidget {
  final List<Movie> movies;
  final double? height;
  final Function(Movie movie)? onTapItem;

  const MovieHorizontalList({
    super.key,
    required this.movies,
    this.height,
    this.onTapItem,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 12),
        itemCount: movies.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => onTapItem?.call(movies[index]),
            child: _buildItem(movies[index]),
          );
        },
      ),
    );
  }

  Widget _buildItem(Movie movie) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: CachedNetworkImage(
          imageUrl:
          '${Constants.BASE_IMAGE_URL}${movie.posterPath}',
          placeholder: (context, url) =>
          const Center(child: CircularProgressIndicator()),
          errorWidget: (context, url, error) =>
          const Center(child: Icon(Icons.error)),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
