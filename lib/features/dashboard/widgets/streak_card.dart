import 'package:flutter/material.dart';
import 'package:shady_os/core/widgets/primary_card.dart';

class StreakCard extends StatelessWidget {
  final int streak;

  const StreakCard({super.key, required this.streak});

  @override
  Widget build(BuildContext context) {
    return PrimaryCard(
      child: Row(
        children: [
          const Icon(
            Icons.local_fire_department,
            size: 40,
            color: Colors.orange,
          ),

          const SizedBox(width: 16),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Current Streak",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),

              Text(
                "$streak Days",
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
