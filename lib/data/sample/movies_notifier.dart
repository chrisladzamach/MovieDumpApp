import 'package:flutter/material.dart';
import '../models/movie.dart';
import '../models/evaluation_criteria.dart';

/// Lista reactiva que usa ValueNotifier para notificar cambios a la UI.
ValueNotifier<List<Movie>> moviesNotifier = ValueNotifier<List<Movie>>([
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
]);
