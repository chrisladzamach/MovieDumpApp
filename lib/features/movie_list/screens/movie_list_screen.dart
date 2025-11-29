import 'package:flutter/material.dart';
import 'package:moviedump/core/constants/app_colors.dart';
import '../../../app/routes.dart';
import '../../../data/sample/movies_notifier.dart';
import '../widgets/movie_card.dart';

class MovieListScreen extends StatelessWidget {
  const MovieListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text("Puntuación películas"),
      ),

      body: Container(
        color: AppColors.background,
        child: ValueListenableBuilder<List<dynamic>>(
          valueListenable: moviesNotifier,
          builder: (_, movies, _) {
            return ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: movies.length,
              itemBuilder: (_, i) => MovieCard(movie: movies[i]),
            );
          },
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, Routes.addMovie),
        child: const Icon(Icons.add),
      ),
    );
  }
}
