import '../entities/movie.dart';
import '../repositories/movie_repository.dart';

class GetFavoriteMoviesUseCase {
  final MovieRepository repository;

  GetFavoriteMoviesUseCase(this.repository);

  Future<List<Movie>> execute() {
    return repository.getFavoriteMovies();
  }
}