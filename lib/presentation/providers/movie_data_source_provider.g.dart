// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_data_source_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$movieRemoteDataSourceHash() =>
    r'37b4cefb9b65c8021895371d45f8ec1b1e4d98aa';

/// See also [movieRemoteDataSource].
@ProviderFor(movieRemoteDataSource)
final movieRemoteDataSourceProvider =
    AutoDisposeProvider<MovieRemoteDataSource>.internal(
  movieRemoteDataSource,
  name: r'movieRemoteDataSourceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$movieRemoteDataSourceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef MovieRemoteDataSourceRef
    = AutoDisposeProviderRef<MovieRemoteDataSource>;
String _$movieLocalDataSourceHash() =>
    r'9782d84fb6bccaeb1fb67c76f291fde81d61b527';

/// See also [movieLocalDataSource].
@ProviderFor(movieLocalDataSource)
final movieLocalDataSourceProvider =
    AutoDisposeFutureProvider<MovieLocalDataSource>.internal(
  movieLocalDataSource,
  name: r'movieLocalDataSourceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$movieLocalDataSourceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef MovieLocalDataSourceRef
    = AutoDisposeFutureProviderRef<MovieLocalDataSource>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
