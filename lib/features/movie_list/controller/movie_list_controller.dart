import '../../../data/sample/movies_notifier.dart';
import '../../../data/models/movie.dart';

class MovieListController {
  List<Movie> getMovies() => moviesNotifier.value;
}
