import 'package:hive/hive.dart';
import 'evaluation_criteria_hive.dart';

part 'movie_hive.g.dart';

@HiveType(typeId: 0)
class Movie extends HiveObject {
  @HiveField(0)
  String title;

  @HiveField(1)
  HiveList<EvaluationCriteria>? criteria;

  @HiveField(2)
  String? notes;

  @HiveField(3)
  String? imagePath;

  Movie({
    required this.title,
    this.criteria,
    this.notes,
    this.imagePath,
  });

  double get averageScore {
    if (criteria == null || criteria!.isEmpty) return 0;
    final total = criteria!.fold(0.0, (sum, c) => sum + c.score);
    return total / criteria!.length;
  }
}
