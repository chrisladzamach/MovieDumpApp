import 'package:hive/hive.dart';
import 'package:moviedump/data/sample/evaluation_criteria.dart';
import '../../../data/models/hive/movie_hive.dart';
import '../../../data/models/hive/evaluation_criteria_hive.dart';

class AddMovieController {
  final List<EvaluationCriteria> criteria = defaultCriteria
      .map((c) => EvaluationCriteria(name: c.name, score: 0.0))
      .toList();

  void updateScore(int index, double newScore) {
    if (index < 0 || index >= criteria.length) return;
    criteria[index].score = newScore;
  }

  Future<void> saveMovie(
    String title,
    String? note, {
    String? imagePath,
  }) async {
    final criteriaBox = Hive.box<EvaluationCriteria>('criteriaBox');
    final movieBox = Hive.box<Movie>('moviesBox');

    for (var c in criteria) {
      await criteriaBox.add(c);
    }

    final movie = Movie(
      title: title,
      criteria: HiveList(criteriaBox)..addAll(criteria),
      notes: note,
      imagePath: imagePath,
    );

    await movieBox.add(movie);

    criteria.clear();
    criteria.addAll(
      defaultCriteria.map((c) => EvaluationCriteria(name: c.name, score: 0.0)),
    );
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
