import 'package:flutter/material.dart';

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
      theme: ThemeData.dark(),
      home: const Scaffold(
        body: Center(
          child: Text(
            'Shady OS',
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
