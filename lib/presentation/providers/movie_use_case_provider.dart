import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/usecases/get_favorite_movies.dart';
import '../../domain/usecases/get_now_playing_movies.dart';
import '../../domain/usecases/get_popular_movies.dart';
import '../../domain/usecases/get_similar_movies.dart';
import '../../domain/usecases/get_top_rated_movies.dart';
import '../../domain/usecases/get_upcoming_movies.dart';
import '../../domain/usecases/toggle_favorite_movie.dart';
import 'movie_repository_provider.dart';

part 'movie_use_case_provider.g.dart';

@riverpod
Future<GetNowPlayingMoviesUseCase> getNowPlayingMoviesUseCase(Ref ref) async {
  final repository = await ref.watch(movieRepositoryProvider.future);
  return GetNowPlayingMoviesUseCase(repository);
}

@riverpod
Future<GetPopularMoviesUseCase> getPopularMoviesUseCase(Ref ref) async {
  final repository = await ref.watch(movieRepositoryProvider.future);
  return GetPopularMoviesUseCase(repository);
}

@riverpod
Future<GetTopRatedMoviesUseCase> getTopRatedMoviesUseCase(Ref ref) async {
  final repository = await ref.watch(movieRepositoryProvider.future);
  return GetTopRatedMoviesUseCase(repository);
}

@riverpod
Future<GetUpcomingMoviesUseCase> getUpcomingMoviesUseCase(Ref ref) async {
  final repository = await ref.watch(movieRepositoryProvider.future);
  return GetUpcomingMoviesUseCase(repository);
}

@riverpod
Future<GetSimilarMoviesUseCase> getSimilarMoviesUseCase(Ref ref) async {
  final repository = await ref.watch(movieRepositoryProvider.future);
  return GetSimilarMoviesUseCase(repository);
}

@riverpod
Future<ToggleFavoriteMovieUseCase> toggleFavoriteMovieUseCase(Ref ref) async {
  final repository = await ref.watch(movieRepositoryProvider.future);
  return ToggleFavoriteMovieUseCase(repository);
}

@riverpod
Future<GetFavoriteMoviesUseCase> getFavoriteMoviesUseCase(Ref ref) async {
  final repository = await ref.watch(movieRepositoryProvider.future);
  return GetFavoriteMoviesUseCase(repository);
}