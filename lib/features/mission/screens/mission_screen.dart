import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/mission_notifier.dart';
import '../widgets/mission_section.dart';
import '../widgets/mission_tile.dart';

class MissionScreen extends ConsumerWidget {
  const MissionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final missionList = ref.watch(missionNotifierProvider);

    final career = missionList.where((m) => m.category == 'Career').toList();

    final health = missionList.where((m) => m.category == 'Health').toList();

    final personal = missionList
        .where((m) => m.category == 'Personal')
        .toList();

    return Scaffold(
      appBar: AppBar(title: const Text("Mission")),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const MissionSection(title: "Career"),

          ...career.map(
            (m) => MissionTile(
              mission: m,
              onChanged: (_) {
                ref.read(missionNotifierProvider.notifier).toggleMission(m.id);
              },
            ),
          ),

          const MissionSection(title: "Health"),

          ...health.map(
            (m) => MissionTile(
              mission: m,
              onChanged: (_) {
                ref.read(missionNotifierProvider.notifier).toggleMission(m.id);
              },
            ),
          ),

          const MissionSection(title: "Personal"),

          ...personal.map(
            (m) => MissionTile(
              mission: m,
              onChanged: (_) {
                ref.read(missionNotifierProvider.notifier).toggleMission(m.id);
              },
            ),
          ),
        ],
      ),
    );
  }
}
