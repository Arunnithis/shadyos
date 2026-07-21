import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

class GreetingCard extends StatelessWidget {
  final String greeting;
  final String username;

  const GreetingCard({
    super.key,
    required this.greeting,
    required this.username,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.card,
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            const CircleAvatar(radius: 28, child: Icon(Icons.person)),
            const SizedBox(width: 18),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "$greeting 👋",
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(username, style: const TextStyle(fontSize: 17)),
                  const SizedBox(height: 8),
                  const Text(
                    "Stay disciplined. Stay dangerous.",
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
