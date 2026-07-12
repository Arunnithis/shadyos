import 'package:flutter/material.dart';
import 'package:shady_os/core/widgets/primary_card.dart';

class ScoreCard extends StatelessWidget {
  final double progress;

  const ScoreCard({super.key, required this.progress});

  @override
  Widget build(BuildContext context) {
    return PrimaryCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Today's Score",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 20),

          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: LinearProgressIndicator(value: progress, minHeight: 12),
          ),

          const SizedBox(height: 12),

          Text(
            "${(progress * 100).toStringAsFixed(0)}%",
            style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
