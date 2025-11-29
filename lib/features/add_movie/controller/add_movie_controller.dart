import '../../../data/models/movie.dart';
import '../../../data/models/evaluation_criteria.dart';
import '../../../data/sample/evaluation_criteria.dart';
import '../../../data/sample/movies_notifier.dart';

class AddMovieController {
  /// Copia de los 4 criterios fijos para rellenar puntajes
  final List<EvaluationCriteria> criteria =
      defaultCriteria.map((c) => EvaluationCriteria(name: c.name, score: 0.0)).toList();

  void updateScore(int index, double newScore) {
    if (index < 0 || index >= criteria.length) return;
    criteria[index].score = newScore;
  }

  void saveMovie(String title, String? note) {
    final newMovie = Movie(
      title: title,
      criteria: criteria,
      notes: note,
    );

    // Actualiza el notifier (creando una nueva lista para notificar correctamente)
    moviesNotifier.value = [...moviesNotifier.value, newMovie];
  }
}
