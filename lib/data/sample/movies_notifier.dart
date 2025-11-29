import 'package:flutter/material.dart';
import '../models/movie.dart';

/// Lista reactiva que usa ValueNotifier para notificar cambios a la UI.
ValueNotifier<List<Movie>> moviesNotifier = ValueNotifier<List<Movie>>([]);
