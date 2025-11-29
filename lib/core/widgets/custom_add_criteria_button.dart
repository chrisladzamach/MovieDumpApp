import 'package:flutter/material.dart';
import 'package:moviedump/core/constants/app_colors.dart';

class CustomAddCriteriaButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomAddCriteriaButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        alignment: Alignment.centerLeft,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        backgroundColor: (text == "Añadir" || text == "Añadir criterio")
            ? Colors.green
            : AppColors.errorValidation,
        foregroundColor: (text == "Añadir") ? Colors.white : Colors.white,
        elevation: 5,
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 14,
          letterSpacing: 1,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
