import 'package:flutter/material.dart';
import '../models/mission.dart';
import '../models/mission_data.dart';
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
    return Scaffold(
      appBar: AppBar(title: const Text("Mission")),
      body: ListView.builder(
        itemCount: missionList.length,
        itemBuilder: (context, index) {
          final mission = missionList[index];

          return MissionTile(
            mission: mission,
            onChanged: (value) {
              setState(() {
                mission.completed = value ?? false;
              });
            },
          );
        },
      ),
    );
  }
}
