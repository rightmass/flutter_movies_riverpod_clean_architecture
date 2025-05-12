import '../../domain/entities/movie.dart';
import '../../domain/repositories/movie_repository.dart';
import '../data_sources/local/movie_local_data_source.dart';
import '../data_sources/remote/movie_remote_data_source.dart';
import '../models/movie_model.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieRemoteDataSource remoteDataSource;
  final MovieLocalDataSource localDataSource;

  MovieRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<List<Movie>> getNowPlayingMovies() async {
    final models = await remoteDataSource.getNowPlayingMovies();
    return models.map((model) => model.toEntity()).toList();
  }

  @override
  Future<List<Movie>> getPopularMovies() async {
    final models = await remoteDataSource.getPopularMovies();
    return models.map((model) => model.toEntity()).toList();
  }

  @override
  Future<List<Movie>> getTopRatedMovies() async {
    final models = await remoteDataSource.getTopRatedMovies();
    return models.map((model) => model.toEntity()).toList();
  }

  @override
  Future<List<Movie>> getUpcomingMovies() async {
    final models = await remoteDataSource.getUpcomingMovies();
    return models.map((model) => model.toEntity()).toList();
  }

  @override
  Future<List<Movie>> getSimilarMovies(int movieId) async {
    final models = await remoteDataSource.getSimilarMovies(movieId);
    return models.map((model) => model.toEntity()).toList();
  }

  @override
  Future<void> saveFavoriteMovies(List<Movie> movies) async {
    final List<MovieModel> movieModels = movies.map((movie) => MovieModel.fromEntity(movie)).toList();
    await localDataSource.saveFavoriteMovieModels(movieModels);
  }

  @override
  Future<List<Movie>> getFavoriteMovies() async {
    final List<MovieModel> movieModels = await localDataSource.getFavoriteMovieModels();
    final List<Movie> movies = movieModels.map((model) => model.toEntity()).toList();
    return movies;
  }
}