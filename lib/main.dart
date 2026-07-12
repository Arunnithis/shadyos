import 'package:flutter/material.dart';
import 'package:shady_os/core/screens/home_screen.dart';
import 'package:shady_os/core/theme/app_theme.dart';

void main() {
  runApp(const ShadyOS());
}

class ShadyOS extends StatelessWidget {
  const ShadyOS({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shady OS',
      theme: AppTheme.darkTheme,
      home: const HomeScreen(),
    );
  }
}
