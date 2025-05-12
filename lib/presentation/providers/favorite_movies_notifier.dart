import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/entities/movie.dart';
import 'movie_use_case_provider.dart';

part 'favorite_movies_notifier.g.dart';

@riverpod
class FavoriteMovies extends _$FavoriteMovies {

  @override
  List<Movie> build() {
    _initializeNotifier();
    return [];
  }

  Future<void> _initializeNotifier() async {
    final getFavoriteUseCase = await ref.watch(getFavoriteMoviesUseCaseProvider.future);
    state = await getFavoriteUseCase.execute();
  }

  Future<void> toggleFavoriteMovie(Movie movieToToggle) async {
    final toggleFavoriteMovieUseCase = await ref.watch(toggleFavoriteMovieUseCaseProvider.future);
    final getFavoriteUseCase = await ref.watch(getFavoriteMoviesUseCaseProvider.future);

    await toggleFavoriteMovieUseCase.execute(movieToToggle);

    state = await getFavoriteUseCase.execute();
  }
}