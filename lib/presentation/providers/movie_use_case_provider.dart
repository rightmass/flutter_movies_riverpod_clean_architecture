import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/usecases/get_now_playing_movies.dart';
import 'movie_repository_provider.dart';

part 'movie_use_case_provider.g.dart';

@riverpod
Future<GetNowPlayingMoviesUseCase> getNowPlayingMoviesUseCase(Ref ref) async {
  final repository = await ref.watch(movieRepositoryProvider.future);
  return GetNowPlayingMoviesUseCase(repository);
}