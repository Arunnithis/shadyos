import 'package:flutter/material.dart';

class AppSectionTitle extends StatelessWidget {
  final String title;

  const AppSectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title.toUpperCase(),
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        letterSpacing: 1.2,
        color: Colors.white,
      ),
    );
  }
}
