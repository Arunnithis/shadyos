import 'package:flutter/material.dart';
import '../models/mission.dart';

class MissionTile extends StatelessWidget {
  final Mission mission;
  final ValueChanged<bool?> onChanged;

  const MissionTile({
    super.key,
    required this.mission,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: mission.completed,
      onChanged: onChanged,
      title: Text(mission.title),
      controlAffinity: ListTileControlAffinity.leading,
    );
  }
}
