import '../entities/movie.dart';
import '../repositories/movie_repository.dart';

class GetTopRatedMoviesUseCase {
  final MovieRepository repository;

  GetTopRatedMoviesUseCase(this.repository);

  Future<List<Movie>> execute() {
    return repository.getTopRatedMovies();
  }
}