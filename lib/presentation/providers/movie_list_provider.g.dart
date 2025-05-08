// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_list_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$nowPlayingMoviesHash() => r'b292c88c3e32750b148e03701509886d35269e3f';

/// See also [nowPlayingMovies].
@ProviderFor(nowPlayingMovies)
final nowPlayingMoviesProvider =
    AutoDisposeFutureProvider<List<Movie>>.internal(
  nowPlayingMovies,
  name: r'nowPlayingMoviesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$nowPlayingMoviesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef NowPlayingMoviesRef = AutoDisposeFutureProviderRef<List<Movie>>;
String _$popularMoviesHash() => r'c1c3a9afbc38fd29305f24c8b8850ebdc2477a1f';

/// See also [popularMovies].
@ProviderFor(popularMovies)
final popularMoviesProvider = AutoDisposeFutureProvider<List<Movie>>.internal(
  popularMovies,
  name: r'popularMoviesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$popularMoviesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef PopularMoviesRef = AutoDisposeFutureProviderRef<List<Movie>>;
String _$topRatedMoviesHash() => r'36313de41aad2ca1e7c2d3cdaf231cfbb8a43614';

/// See also [topRatedMovies].
@ProviderFor(topRatedMovies)
final topRatedMoviesProvider = AutoDisposeFutureProvider<List<Movie>>.internal(
  topRatedMovies,
  name: r'topRatedMoviesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$topRatedMoviesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef TopRatedMoviesRef = AutoDisposeFutureProviderRef<List<Movie>>;
String _$upcomingMoviesHash() => r'5a3346db9a82de28532fb4d92c75407615d47290';

/// See also [upcomingMovies].
@ProviderFor(upcomingMovies)
final upcomingMoviesProvider = AutoDisposeFutureProvider<List<Movie>>.internal(
  upcomingMovies,
  name: r'upcomingMoviesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$upcomingMoviesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef UpcomingMoviesRef = AutoDisposeFutureProviderRef<List<Movie>>;
String _$similarMoviesHash() => r'20574591060157115c9ae7ee8cafcc94e1bfb3c5';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [similarMovies].
@ProviderFor(similarMovies)
const similarMoviesProvider = SimilarMoviesFamily();

/// See also [similarMovies].
class SimilarMoviesFamily extends Family<AsyncValue<List<Movie>>> {
  /// See also [similarMovies].
  const SimilarMoviesFamily();

  /// See also [similarMovies].
  SimilarMoviesProvider call(
    int movieId,
  ) {
    return SimilarMoviesProvider(
      movieId,
    );
  }

  @override
  SimilarMoviesProvider getProviderOverride(
    covariant SimilarMoviesProvider provider,
  ) {
    return call(
      provider.movieId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'similarMoviesProvider';
}

/// See also [similarMovies].
class SimilarMoviesProvider extends AutoDisposeFutureProvider<List<Movie>> {
  /// See also [similarMovies].
  SimilarMoviesProvider(
    int movieId,
  ) : this._internal(
          (ref) => similarMovies(
            ref as SimilarMoviesRef,
            movieId,
          ),
          from: similarMoviesProvider,
          name: r'similarMoviesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$similarMoviesHash,
          dependencies: SimilarMoviesFamily._dependencies,
          allTransitiveDependencies:
              SimilarMoviesFamily._allTransitiveDependencies,
          movieId: movieId,
        );

  SimilarMoviesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.movieId,
  }) : super.internal();

  final int movieId;

  @override
  Override overrideWith(
    FutureOr<List<Movie>> Function(SimilarMoviesRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SimilarMoviesProvider._internal(
        (ref) => create(ref as SimilarMoviesRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        movieId: movieId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Movie>> createElement() {
    return _SimilarMoviesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SimilarMoviesProvider && other.movieId == movieId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, movieId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin SimilarMoviesRef on AutoDisposeFutureProviderRef<List<Movie>> {
  /// The parameter `movieId` of this provider.
  int get movieId;
}

class _SimilarMoviesProviderElement
    extends AutoDisposeFutureProviderElement<List<Movie>>
    with SimilarMoviesRef {
  _SimilarMoviesProviderElement(super.provider);

  @override
  int get movieId => (origin as SimilarMoviesProvider).movieId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
