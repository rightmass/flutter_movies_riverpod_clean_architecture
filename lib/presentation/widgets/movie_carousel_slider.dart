import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/movie.dart';
import '../../utils/constants.dart';

class MovieCarouselSlider extends StatelessWidget {
  final List<Movie> movies;
  final String? title;
  final Function(Movie movie)? onTapItem;

  const MovieCarouselSlider({
    super.key,
    required this.movies,
    this.title,
    this.onTapItem,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: movies.length,
      itemBuilder: (context, index, realIndex) {
        if (onTapItem != null) {
          return GestureDetector(
            onTap: () {
              onTapItem!(movies[index]);
            },
            child: _buildItem(movies[index]),
          );
        } else {
          return _buildItem(movies[index]);
        }
      },
      options: CarouselOptions(
        aspectRatio: 0.9,
        enlargeFactor: 0.2,
        viewportFraction: 0.75,
        autoPlay: true,
        enlargeCenterPage: true,
        autoPlayAnimationDuration: const Duration(seconds: 1),
      ),
    );
  }

  Widget _buildItem(Movie movie) {
    return ClipRRect(
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
    );
  }
}