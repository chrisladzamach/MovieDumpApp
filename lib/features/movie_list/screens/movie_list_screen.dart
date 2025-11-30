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
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text(
          "Puntuación películas",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),

      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ValueListenableBuilder(
              valueListenable: moviesNotifier,
              builder: (context, movies, _) {
                if (movies.isEmpty) {
                  return Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      margin: const EdgeInsets.only(top: 40),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Colors.white.withValues(alpha: 0.2),
                          width: 1,
                        ),
                      ),
                      child: Column(
                        children: const [
                          Text(
                            "Aún no has añadido ninguna película.\nAñade una para iniciar tu lista.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 22,
                              fontWeight: FontWeight.w100,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            "Haz click en el botón para añadir una.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 28,
                              fontWeight: FontWeight.w200,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }

                return ListView.builder(
                  itemCount: movies.length,
                  itemBuilder: (context, index) {
                    final movie = movies[index];

                    return MovieCard(
                      movie: movie,
                      onDelete: () {
                        deleteMovie(movie);
                      },
                    );
                  },
                );
              },
            ),
          ),

          ValueListenableBuilder(
            valueListenable: moviesNotifier,
            builder: (context, movies, _) {
              if (movies.isNotEmpty) return SizedBox.shrink();

              return Positioned(
                bottom: 80,
                right: 5,
                child: Column(
                  children: const [
                    Icon(
                      Icons.arrow_downward,
                      size: 80,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, Routes.addMovie);
        },
        backgroundColor: AppColors.buttonColor,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
