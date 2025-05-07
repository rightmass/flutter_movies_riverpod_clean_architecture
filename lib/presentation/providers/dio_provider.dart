import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dio_provider.g.dart';

@riverpod
Dio dio(Ref ref) {
  final apiKey = dotenv.env['TMDB_API_KEY']!;
  const baseUrl = 'https://api.themoviedb.org/3';

  final baseOptions = BaseOptions(
    baseUrl: baseUrl,
    headers: {
      'Authorization': 'Bearer $apiKey',
      'Content-Type': 'application/json',
    },
  );

  return Dio(baseOptions);
}