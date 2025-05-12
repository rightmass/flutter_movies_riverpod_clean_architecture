import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/repositories/movie_repository_impl.dart';
import '../../domain/repositories/movie_repository.dart';
import 'movie_data_source_provider.dart';

part 'movie_repository_provider.g.dart';

@riverpod
Future<MovieRepository> movieRepository(Ref ref) async {
  final remoteDataSource = ref.watch(movieRemoteDataSourceProvider);
  final localDataSource = await ref.watch(movieLocalDataSourceProvider.future);

  return MovieRepositoryImpl(
    remoteDataSource: remoteDataSource,
    localDataSource: localDataSource,
  );
}