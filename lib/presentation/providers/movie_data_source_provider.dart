import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/data_sources/remote/movie_remote_data_source.dart';
import 'dio_provider.dart';

part 'movie_data_source_provider.g.dart';

@riverpod
MovieRemoteDataSource movieRemoteDataSource(Ref ref) {
  final dio = ref.watch(dioProvider);
  return MovieRemoteDataSourcesImpl(dio);
}