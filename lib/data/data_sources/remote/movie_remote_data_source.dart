import 'package:dio/dio.dart';

import '../../models/movie_model.dart';

abstract class MovieRemoteDataSource {
  Future<List<MovieModel>> getNowPlayingMovies();
}

class MovieRemoteDataSourcesImpl implements MovieRemoteDataSource {
  final Dio dio;

  MovieRemoteDataSourcesImpl(this.dio);

  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    try {
      final response = await dio.get(
        '/movie/now_playing',
        queryParameters: {
          'language': 'ko-KR',
          'page': 1,
        },
      );

      if (response.statusCode == 200) {
        List<dynamic> results = response.data['results'];
        return results.map((json) => MovieModel.fromJson(json)).toList();
      } else {
        throw Exception(
            'Failed to load now playing movies: ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw Exception('Dio Error ${e.message}');
    } catch (e) {
      throw Exception('unexpected error $e');
    }
  }
}