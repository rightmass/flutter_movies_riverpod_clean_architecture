import '../entities/movie.dart';

abstract class MovieRepository {
  // remote
  Future<List<Movie>> getNowPlayingMovies();
  Future<List<Movie>> getPopularMovies();
  Future<List<Movie>> getTopRatedMovies();
  Future<List<Movie>> getUpcomingMovies();
  Future<List<Movie>> getSimilarMovies(int movieId);

  // local
  Future<void> saveFavoriteMovies(List<Movie> movies);
  Future<List<Movie>> getFavoriteMovies();
}
