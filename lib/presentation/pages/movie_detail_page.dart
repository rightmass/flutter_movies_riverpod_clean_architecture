import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../domain/entities/movie.dart';
import '../../utils/constants.dart';
import '../providers/favorite_movies_notifier.dart';
import '../providers/movie_list_provider.dart';
import '../widgets/movie_vertical_grid.dart';

class MovieDetailPage extends ConsumerWidget {
  final Movie movie;

  const MovieDetailPage({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final similarMovies = ref.watch(similarMoviesProvider(movie.id));
    final favoriteMovies = ref.watch(favoriteMoviesProvider);
    final isFavorite = favoriteMovies.any((favMovie) => favMovie.id == movie.id);

    return Scaffold(
      body: SafeArea(
        top: false,
        child: CustomScrollView(
          slivers: [
            SliverAppBar.large(
              automaticallyImplyLeading: false,
              actions: [_buildFavoriteButton(ref, isFavorite), _buildCloseButton(context)],
              expandedHeight: 300,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text(
                  movie.title,
                  style: GoogleFonts.gowunDodum(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                background: _buildFlexibleSpaceBarBackground(),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              sliver: SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildMovieInfoSection(),
                    const Divider(height: 40),
                    Text(
                      'Similar',
                      style: GoogleFonts.gowunDodum(fontSize: 20),
                    ),
                    const SizedBox(height: 8),
                    _buildSimilarMoviesSection(context, similarMovies),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCloseButton(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      margin: const EdgeInsets.only(right: 18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.black54,
      ),
      child: IconButton(
        icon: const Icon(Icons.close),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  Widget _buildFavoriteButton(WidgetRef ref, bool isFavorite) {
    return Container(
      width: 40,
      height: 40,
      margin: const EdgeInsets.only(right: 18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.black54,
      ),
      child: IconButton(
        icon: isFavorite
            ? const Icon(Icons.favorite)
            : const Icon(Icons.favorite_border),
        onPressed: () {
          ref.read(favoriteMoviesProvider.notifier).toggleFavoriteMovie(movie);
        },
      ),
    );
  }

  Widget _buildFlexibleSpaceBarBackground() {
    return ShaderMask(
      shaderCallback: (rect) {
        return const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.black, Colors.transparent],
          stops: [0.5, 0.9],
        ).createShader(rect);
      },
      blendMode: BlendMode.dstIn,
      child: CachedNetworkImage(
        imageUrl: '${Constants.BASE_IMAGE_URL}${movie.backdropPath}',
        placeholder: (context, url) =>
            const Center(child: CircularProgressIndicator()),
        errorWidget: (context, url, error) => const SizedBox.shrink(),
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildMovieInfoSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          color: Colors.white10,
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              const Icon(
                Icons.star,
                color: Colors.amber,
                size: 14,
              ),
              const SizedBox(width: 2),
              Text('${(movie.voteAverage ?? 0).toStringAsFixed(1)}/10'),
              const SizedBox(width: 2),
              Text(
                '(${movie.voteCount ?? 0})',
                style: const TextStyle(color: Colors.lightBlue),
              ),
              const Spacer(),
              Text(movie.releaseDate ?? ''),
            ],
          ),
        ),
        const SizedBox(height: 12),
        Text(
          movie.overview ?? '',
          style: GoogleFonts.gowunDodum(fontSize: 16),
        ),
      ],
    );
  }

  Widget _buildSimilarMoviesSection(
    BuildContext context,
    AsyncValue<List<Movie>> asyncValue,
  ) {
    return asyncValue.when(
      data: (movies) => MovieVerticalGrid(
        movies: movies,
        onTapItem: (movie) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MovieDetailPage(movie: movie),
              fullscreenDialog: true,
            ),
          );
        },
      ),
      error: (error, stackTrace) => Center(child: Text(error.toString())),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}
