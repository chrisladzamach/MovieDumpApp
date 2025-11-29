import 'package:moviedump/data/models/evaluation_criteria.dart';

import '../models/movie.dart';

final List<Movie> sampleMovies = [
  Movie(
    title: "Interestellar",
    criteria: [
      EvaluationCriteria(name: "Fotografía / Efectos visuales", score: 10),
      EvaluationCriteria(name: "Guion", score: 9),
      EvaluationCriteria(name: "Banda sonora", score: 9),
      EvaluationCriteria(name: "Actuación", score: 8),
    ],
  ),
  Movie(
    title: "Avatar",
    criteria: [
      EvaluationCriteria(name: "Fotografía / Efectos visuales", score: 10),
      EvaluationCriteria(name: "Guion", score: 9),
      EvaluationCriteria(name: "Banda sonora", score: 9),
      EvaluationCriteria(name: "Actuación", score: 8),
    ],
  ),
];
