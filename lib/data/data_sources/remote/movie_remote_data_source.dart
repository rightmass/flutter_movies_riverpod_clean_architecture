import 'package:dio/dio.dart';

import '../../models/movie_model.dart';

abstract class MovieRemoteDataSource {
  Future<List<MovieModel>> getNowPlayingMovies();
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getTopRatedMovies();
  Future<List<MovieModel>> getUpcomingMovies();
  Future<List<MovieModel>> getSimilarMovies(int movieId);
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

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    try {
      final response = await dio.get(
        '/movie/popular',
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
            'Failed to load popular movies: ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw Exception('Dio Error ${e.message}');
    } catch (e) {
      throw Exception('unexpected error $e');
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    try {
      final response = await dio.get(
        '/movie/top_rated',
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
            'Failed to load top rated movies: ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw Exception('Dio Error ${e.message}');
    } catch (e) {
      throw Exception('unexpected error $e');
    }
  }

  @override
  Future<List<MovieModel>> getUpcomingMovies() async {
    try {
      final response = await dio.get(
        '/movie/upcoming',
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
            'Failed to load upcoming movies: ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw Exception('Dio Error ${e.message}');
    } catch (e) {
      throw Exception('unexpected error $e');
    }
  }

  @override
  Future<List<MovieModel>> getSimilarMovies(int movieId) async {
    try {
      final response = await dio.get(
        '/movie/$movieId/similar',
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
            'Failed to load similar movies: ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw Exception('Dio Error ${e.message}');
    } catch (e) {
      throw Exception('unexpected error $e');
    }
  }
}