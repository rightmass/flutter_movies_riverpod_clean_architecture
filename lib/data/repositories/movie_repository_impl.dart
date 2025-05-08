import '../../domain/entities/movie.dart';
import '../../domain/repositories/movie_repository.dart';
import '../data_sources/remote/movie_remote_data_source.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieRemoteDataSource remoteDataSource;

  MovieRepositoryImpl({
    required this.remoteDataSource,
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
}