import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../models/movie_model.dart';

abstract class MovieLocalDataSource {
  Future<void> saveFavoriteMovieModels(List<MovieModel> movieModels);
  Future<List<MovieModel>> getFavoriteMovieModels();
}

class MovieLocalDataSourceImpl implements MovieLocalDataSource {
  final SharedPreferences sharedPreferences;
  static const String _favoriteMoviesKey = 'favoriteMovies';

  MovieLocalDataSourceImpl(this.sharedPreferences);

  @override
  Future<void> saveFavoriteMovieModels(List<MovieModel> movieModels) async {
    final List<Map<String, dynamic>> jsonList = movieModels.map((model) => model.toJson()).toList();
    final List<String> stringList = jsonList.map((json) => jsonEncode(json)).toList();
    await sharedPreferences.setStringList(_favoriteMoviesKey, stringList);
  }

  @override
  Future<List<MovieModel>> getFavoriteMovieModels() async {
    final List<String>? stringList = sharedPreferences.getStringList(_favoriteMoviesKey);

    if (stringList == null) {
      return [];
    }

    final List<Map<String, dynamic>> jsonList = stringList.map((string) => jsonDecode(string) as Map<String, dynamic>).toList();
    final List<MovieModel> movieModels = jsonList.map((json) => MovieModel.fromJson(json)).toList();
    return movieModels;
  }
}