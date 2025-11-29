import 'package:flutter/material.dart';

class CriteriaItem extends StatelessWidget {
  final String name;
  final double score;
  final ValueChanged<double>? onScoreChanged;

  const CriteriaItem({
    super.key,
    required this.name,
    required this.score,
    this.onScoreChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              "$name:",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(
            width: 80,
            child: TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(hintText: "0.0"),
              onChanged: (value) {
                onScoreChanged?.call(double.tryParse(value) ?? 0.0);
              },
            ),
          ),
        ],
      ),
    );
  }
}
