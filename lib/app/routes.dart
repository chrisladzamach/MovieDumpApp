import 'package:flutter/material.dart';
import '../features/movie_list/screens/movie_list_screen.dart';
import '../features/add_movie/screens/add_movie_screen.dart';

class Routes {
  static const movieList = '/';
  static const addMovie = '/add-movie';

  static Map<String, WidgetBuilder> getRoutes() => {
        movieList: (_) => const MovieListScreen(),
        addMovie: (_) => const AddMovieScreen(),
      };
}
