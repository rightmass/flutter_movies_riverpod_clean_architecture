import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/entities/movie.dart';
import 'movie_use_case_provider.dart';

part 'movie_list_provider.g.dart';

@riverpod
Future<List<Movie>> nowPlayingMovies(Ref ref) async {
  final getNowPlayingMovies = await ref.watch(getNowPlayingMoviesUseCaseProvider.future);
  return getNowPlayingMovies.execute();
}

@riverpod
Future<List<Movie>> popularMovies(Ref ref) async {
  final getPopularMovies = await ref.watch(getPopularMoviesUseCaseProvider.future);
  return getPopularMovies.execute();
}

@riverpod
Future<List<Movie>> topRatedMovies(Ref ref) async {
  final getTopRatedMovies = await ref.watch(getTopRatedMoviesUseCaseProvider.future);
  return getTopRatedMovies.execute();
}

@riverpod
Future<List<Movie>> upcomingMovies(Ref ref) async {
  final getUpcomingMovies = await ref.watch(getUpcomingMoviesUseCaseProvider.future);
  return getUpcomingMovies.execute();
}

@riverpod
Future<List<Movie>> similarMovies(Ref ref, int movieId) async {
  final getSimilarMovies = await ref.watch(getSimilarMoviesUseCaseProvider.future);
  return getSimilarMovies.execute(movieId);
}