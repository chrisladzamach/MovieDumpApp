import '../../../data/models/hive/movie_hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class MovieListController {
  List<Movie> getMovies() {
    final movieBox = Hive.box<Movie>('moviesBox');
    return movieBox.values.toList();
  }
}
