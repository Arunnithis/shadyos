import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/mission.dart';
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
          ...career.map((mission) => buildTile(ref, mission)),

          const MissionSection(title: "Health"),
          ...health.map((mission) => buildTile(ref, mission)),

          const MissionSection(title: "Personal"),
          ...personal.map((mission) => buildTile(ref, mission)),
        ],
      ),
    );
  }

  Widget buildTile(WidgetRef ref, Mission mission) {
    return MissionTile(
      mission: mission,
      onChanged: (_) {
        ref.read(missionNotifierProvider.notifier).toggleMission(mission.id);
      },
    );
  }
}
