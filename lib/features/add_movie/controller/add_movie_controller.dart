import '../../../data/models/movie.dart';
import '../../../data/models/evaluation_criteria.dart';
import '../../../data/sample/evaluation_criteria.dart';
import '../../../data/sample/movies_notifier.dart';

class AddMovieController {
  final List<EvaluationCriteria> criteria = defaultCriteria
      .map((c) => EvaluationCriteria(name: c.name, score: 0.0))
      .toList();

  void updateScore(int index, double newScore) {
    if (index < 0 || index >= criteria.length) return;
    criteria[index].score = newScore;
  }

  void saveMovie(String title, String? note, {String? imagePath}) {
    final newMovie = Movie(
      title: title,
      criteria: criteria,
      notes: note,
      imagePath: imagePath,
    );

    moviesNotifier.value = [...moviesNotifier.value, newMovie];
  }

  void addCriteria(String name) {
    if (name.trim().isEmpty) return;

    criteria.add(EvaluationCriteria(name: name.trim(), score: 0.0));
  }

  void reset() {
    criteria
      ..clear()
      ..addAll(
        defaultCriteria.map(
          (c) => EvaluationCriteria(name: c.name, score: 0.0),
        ),
      );
  }

}
