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