import '../entities/movie.dart';
import '../repositories/movie_repository.dart';

class GetNowPlayingMoviesUseCase {
  final MovieRepository repository;

  GetNowPlayingMoviesUseCase(this.repository);

  Future<List<Movie>> execute() {
    return repository.getNowPlayingMovies();
  }
}