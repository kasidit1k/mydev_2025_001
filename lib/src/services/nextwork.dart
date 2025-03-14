import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:myapp/src/configs/api.dart';
import 'package:myapp/src/model/upcoming_movie_model.dart';

class NetworkService {
  NetworkService._internal();
  static final NetworkService _instance = NetworkService._internal();
  factory NetworkService() => _instance;
  static final Dio _dio = Dio();

  Future<UpcomingMovieModel> getUpcomingMovieDio() async {
    final response = await _dio.get(API.MOVIE_URL);
    if (response.statusCode == 200) {
      print(response.data);
      return upcomingMovieModelFromJson(json.encode(response.data));
    }
    throw Exception('Network failed');
  }
}
