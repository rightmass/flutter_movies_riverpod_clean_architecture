import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/data_sources/local/movie_local_data_source.dart';
import '../../data/data_sources/remote/movie_remote_data_source.dart';
import 'dio_provider.dart';
import 'shared_preferences_provider.dart';

part 'movie_data_source_provider.g.dart';

@riverpod
MovieRemoteDataSource movieRemoteDataSource(Ref ref) {
  final dio = ref.watch(dioProvider);
  return MovieRemoteDataSourcesImpl(dio);
}

@riverpod
Future<MovieLocalDataSource> movieLocalDataSource(Ref ref) async {
  final sharedPreferences = await ref.watch(sharedPreferencesProvider.future);
  return MovieLocalDataSourceImpl(sharedPreferences);
}