import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:moviedump/app/app.dart';
import 'data/models/hive/movie_hive.dart';
import 'data/models/hive/evaluation_criteria_hive.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(MovieAdapter());
  Hive.registerAdapter(EvaluationCriteriaAdapter());

  await Hive.openBox<Movie>('moviesBox');
  await Hive.openBox<EvaluationCriteria>('criteriaBox');

  runApp(const MyApp());
}
