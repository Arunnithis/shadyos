import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/water_notifier.dart';

class WaterScreen extends ConsumerWidget {
  const WaterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final water = ref.watch(waterNotifierProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("Water")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Daily Goal",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 25),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                6,
                (index) => Icon(
                  Icons.water_drop,
                  size: 40,
                  color: index < water.glasses ? Colors.blue : Colors.grey,
                ),
              ),
            ),

            const SizedBox(height: 25),

            Center(
              child: Text(
                "${water.glasses} / 6 Glasses",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  ref.read(waterNotifierProvider.notifier).addGlass();
                },
                icon: const Icon(Icons.add),
                label: const Text("Add Glass"),
              ),
            ),

            const SizedBox(height: 12),

            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () {
                  ref.read(waterNotifierProvider.notifier).reset();
                },
                icon: const Icon(Icons.refresh),
                label: const Text("Reset"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
