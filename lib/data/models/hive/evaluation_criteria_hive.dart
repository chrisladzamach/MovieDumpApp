import 'package:hive/hive.dart';

part 'evaluation_criteria_hive.g.dart';

@HiveType(typeId: 1) // ID único para este modelo
class EvaluationCriteria extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  double score;

  EvaluationCriteria({
    required this.name,
    required this.score,
  });
}
