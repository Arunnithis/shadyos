import 'package:flutter/material.dart';

class AppProgressBar extends StatelessWidget {
  final double value;
  final Color color;

  const AppProgressBar({super.key, required this.value, required this.color});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: LinearProgressIndicator(
        value: value,
        minHeight: 10,
        backgroundColor: Colors.white10,
        valueColor: AlwaysStoppedAnimation(color),
      ),
    );
  }
}
