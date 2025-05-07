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
}