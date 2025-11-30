import 'package:flutter/material.dart';
import 'package:moviedump/data/models/evaluation_criteria.dart';
import '../models/movie.dart';

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
      EvaluationCriteria(name: "Fotografía / Efectos visuales", score: 9),
      EvaluationCriteria(name: "Guion", score: 4.9),
      EvaluationCriteria(name: "Banda sonora", score: 5.9),
      EvaluationCriteria(name: "Actuación", score: 6.8),
    ],
  ),
]);

void addMovie(Movie movie) {
  moviesNotifier.value = [...moviesNotifier.value, movie];
}

void deleteMovie(Movie movie) {
  moviesNotifier.value =
      moviesNotifier.value.where((m) => m != movie).toList();
}