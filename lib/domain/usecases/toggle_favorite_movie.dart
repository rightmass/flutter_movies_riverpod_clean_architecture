import '../entities/movie.dart';
import '../repositories/movie_repository.dart';

class ToggleFavoriteMovieUseCase {
  final MovieRepository repository;

  ToggleFavoriteMovieUseCase(this.repository);

  Future<void> execute(Movie movieToToggle) async {
    List<Movie> currentFavorites = await repository.getFavoriteMovies();
    bool isFavorite = currentFavorites.any((movie) => movie.id == movieToToggle.id);

    if (isFavorite) {
      currentFavorites.removeWhere((movie) => movie.id == movieToToggle.id);
    } else {
      currentFavorites.add(movieToToggle);
    }
    await repository.saveFavoriteMovies(currentFavorites);
  }
}