import 'package:flutter/material.dart';
import 'package:myapp/src/pages/home/home_page.dart';
import 'package:myapp/src/pages/info/info_page.dart';
import 'package:myapp/src/pages/movie/movie_detail_pages.dart';
import 'package:myapp/src/pages/movie/upcoming_movie_page.dart';

//route'

class AppRoute {
  static const homeRoute = 'home';
  static const infoRoute = 'info';
  static const UpcomingMovieRoute = 'upcoming';
  static const movieDetailRoute = 'movie';

  final _route = <String, WidgetBuilder>{
    homeRoute: (context) => HomePage(),
    infoRoute: (context) => InfoPage(),
    UpcomingMovieRoute: (context) => UpcomingMoviePage(),
    movieDetailRoute: (context) => MovieDetailPage(),
  };

  get getAll => _route;
}
