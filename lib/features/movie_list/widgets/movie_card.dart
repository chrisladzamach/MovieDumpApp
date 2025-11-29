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
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white30),
              borderRadius: BorderRadius.circular(12),
            ),
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
