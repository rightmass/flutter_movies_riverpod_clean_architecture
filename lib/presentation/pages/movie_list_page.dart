import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../domain/entities/movie.dart';
import '../providers/movie_list_provider.dart';
import '../widgets/movie_carousel_slider.dart';
import '../widgets/movie_horizontal_list.dart';
import 'movie_detail_page.dart';

class MovieListPage extends ConsumerWidget {
  const MovieListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final popularMovies = ref.watch(popularMoviesProvider);
    final topRatedMovies = ref.watch(topRatedMoviesProvider);
    final upcomingMovies = ref.watch(upcomingMoviesProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Flutter Movies',
          style: GoogleFonts.gowunDodum(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              nowPlayingMovies.when(
                data: (movies) => MovieCarouselSlider(
                  movies: movies,
                  onTapItem: (movie) {
                    _showMovieDetailPage(context, movie);
                  },
                ),
                error: (error, stackTrace) =>
                    Center(child: Text(error.toString())),
                loading: () => const Center(child: CircularProgressIndicator()),
              ),
              _buildMovieHorizontalListSection(context, 'Popular', popularMovies),
              _buildMovieHorizontalListSection(context, 'Top Rated', topRatedMovies),
              _buildMovieHorizontalListSection(context, 'Upcoming', upcomingMovies),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }

  void _showMovieDetailPage(BuildContext context, Movie movie) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MovieDetailPage(movie: movie),
        fullscreenDialog: true,
      ),
    );
  }

  Widget _buildMovieHorizontalListSection(
    BuildContext context,
    String title,
    AsyncValue<List<Movie>> asyncValue,
  ) {
    return asyncValue.when(
      data: (movies) => movies.isNotEmpty
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(18, 24, 18, 8),
                  child: Text(
                    title,
                    style: GoogleFonts.gowunDodum(fontSize: 20),
                  ),
                ),
                MovieHorizontalList(
                  movies: movies,
                  onTapItem: (movie) {
                    _showMovieDetailPage(context, movie);
                  },
                ),
              ],
            )
          : const SizedBox.shrink(),
      error: (error, stackTrace) => Center(child: Text(error.toString())),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}
