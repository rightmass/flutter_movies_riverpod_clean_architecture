import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/movie.dart';
import '../../utils/constants.dart';

class MovieVerticalGrid extends StatelessWidget {
  final List<Movie> movies;
  final Function(Movie item)? onTapItem;

  const MovieVerticalGrid({
    super.key,
    required this.movies,
    this.onTapItem,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: movies.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => onTapItem?.call(movies[index]),
          child: _buildItem(movies[index]),
        );
      },
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 18,
        mainAxisSpacing: 18,
        childAspectRatio: 0.7,
      ),
    );
  }

  Widget _buildItem(Movie movie) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: CachedNetworkImage(
        imageUrl: '${Constants.BASE_IMAGE_URL}${movie.posterPath}',
        placeholder: (context, url) =>
        const Center(child: CircularProgressIndicator()),
        errorWidget: (context, url, error) =>
        const Center(child: Icon(Icons.error)),
        fit: BoxFit.cover,
      ),
    );
  }
}
