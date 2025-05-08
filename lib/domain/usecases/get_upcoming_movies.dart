import '../entities/movie.dart';
import '../repositories/movie_repository.dart';

class GetUpcomingMoviesUseCase {
  final MovieRepository repository;

  GetUpcomingMoviesUseCase(this.repository);

  Future<List<Movie>> execute() {
    return repository.getUpcomingMovies();
  }
}