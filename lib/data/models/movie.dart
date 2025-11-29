import 'evaluation_criteria.dart';

class Movie {
  String title;
  List<EvaluationCriteria> criteria;
  String? notes;
  String? imagePath;

  Movie({
    required this.title,
    required this.criteria,
    this.notes,
    this.imagePath,
  });

  double get averageScore {
    if (criteria.isEmpty) return 0;
    final total = criteria.fold(0.0, (sum, c) => sum + c.score);
    return total / criteria.length;
  }
}
