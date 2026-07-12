import 'package:flutter/material.dart';
import '../models/mission.dart';
import '../models/mission_data.dart';
import '../widgets/mission_section.dart';
import '../widgets/mission_tile.dart';

class MissionScreen extends StatefulWidget {
  const MissionScreen({super.key});

  @override
  State<MissionScreen> createState() => _MissionScreenState();
}

class _MissionScreenState extends State<MissionScreen> {
  final List<Mission> missionList = missions;

  @override
  Widget build(BuildContext context) {
    final career = missionList.where((m) => m.category == "Career").toList();

    final health = missionList.where((m) => m.category == "Health").toList();

    final personal = missionList
        .where((m) => m.category == "Personal")
        .toList();

    return Scaffold(
      appBar: AppBar(title: const Text("Mission")),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const MissionSection(title: "Career"),
          ...career.map(buildTile),

          const MissionSection(title: "Health"),
          ...health.map(buildTile),

          const MissionSection(title: "Personal"),
          ...personal.map(buildTile),
        ],
      ),
    );
  }

  Widget buildTile(Mission mission) {
    return MissionTile(
      mission: mission,
      onChanged: (value) {
        setState(() {
          mission.completed = value ?? false;
        });
      },
    );
  }
}
