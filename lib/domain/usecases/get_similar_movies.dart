import '../entities/movie.dart';
import '../repositories/movie_repository.dart';

class GetSimilarMoviesUseCase {
  final MovieRepository repository;

  GetSimilarMoviesUseCase(this.repository);

  Future<List<Movie>> execute(int movieId) {
    return repository.getSimilarMovies(movieId);
  }
}