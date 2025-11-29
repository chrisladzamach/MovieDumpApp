import 'dart:io';

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import '../../../../data/models/movie.dart';
import '../../../../core/constants/app_colors.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;

  const MovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          // Imagen opcional: si hay ruta y no es web, mostramos FileImage.
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white30),
              borderRadius: BorderRadius.circular(12),
              image: _buildDecorationImage(),
            ),
            child: _buildImageFallback(),
          ),

          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  movie.title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Text(
                      "Score: ${movie.averageScore.toStringAsFixed(1)}",
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.white70,
                      ),
                    ),
                    SizedBox(width: 6),
                    Row(children: _buildStars(movie.averageScore)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  DecorationImage? _buildDecorationImage() {
    // Si estamos en web no podemos usar FileImage.
    if (movie.imagePath == null || movie.imagePath!.isEmpty) return null;

    if (kIsWeb) {
      // Si en algún momento guardas URLs en lugar de rutas locales,
      // puedes cambiar esto a NetworkImage(movie.imagePath!)
      return null;
    }

    try {
      final file = File(movie.imagePath!);
      if (!file.existsSync()) return null;
      return DecorationImage(image: FileImage(file), fit: BoxFit.cover);
    } catch (_) {
      return null;
    }
  }

  Widget? _buildImageFallback() {
    // Si no hay imagen (o no se puede mostrar), mostramos un icono.
    if (movie.imagePath == null || movie.imagePath!.isEmpty) {
      return const Icon(Icons.image, color: Colors.white38);
    }

    // En web, si el path no es una URL, aún mostramos el icono.
    if (kIsWeb) {
      return const Icon(Icons.image, color: Colors.white38);
    }

    // Si llegamos aquí y hay archivo válido, no mostramos nada extra
    // porque la imagen ya está en DecorationImage.
    return null;
  }

  List<Widget> _buildStars(double score) {
    // Convertir 0–10 -> 0–5
    double starRating = (score / 10) * 5;

    int fullStars = starRating.floor();
    bool halfStar = (starRating - fullStars) >= 0.5;
    int emptyStars = 5 - fullStars - (halfStar ? 1 : 0);

    return [
      ...List.generate(
        fullStars,
        (_) => const Icon(Icons.star, color: Colors.yellow, size: 20),
      ),

      if (halfStar) const Icon(Icons.star_half, color: Colors.yellow, size: 20),

      ...List.generate(
        emptyStars,
        (_) => const Icon(Icons.star_border, color: Colors.yellow, size: 20),
      ),
    ];
  }
}
