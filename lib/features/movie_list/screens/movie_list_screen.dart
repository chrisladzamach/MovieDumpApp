import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:moviedump/core/constants/app_colors.dart';
import '../../../app/routes.dart';
import '../../../data/models/hive/movie_hive.dart';
import '../widgets/movie_card.dart';

class MovieListScreen extends StatelessWidget {
  const MovieListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final movieBox = Hive.box<Movie>('moviesBox');

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
              valueListenable: movieBox.listenable(),
              builder: (context, Box<Movie> box, _) {
                if (box.isEmpty) {
                  return Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      margin: const EdgeInsets.only(top: 40),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Colors.white,
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

                final movies = box.values.toList();

                return ListView.builder(
                  itemCount: movies.length,
                  itemBuilder: (context, index) {
                    final movie = movies[index];

                    return MovieCard(
                      movie: movie,
                      onDelete: () {
                        movie.delete();
                      },
                    );
                  },
                );
              },
            ),
          ),

          // Flecha de orientación
          ValueListenableBuilder(
            valueListenable: movieBox.listenable(),
            builder: (context, Box<Movie> box, _) {
              if (box.isNotEmpty) return const SizedBox.shrink();

              return Positioned(
                bottom: 80,
                right: 5,
                child: const Icon(
                  Icons.arrow_downward,
                  size: 80,
                  color: Colors.blue,
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
