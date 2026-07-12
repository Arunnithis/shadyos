import 'package:flutter/material.dart';
import 'package:shady_os/core/widgets/primary_card.dart';
import 'package:shady_os/core/widgets/summary_tile.dart';

class SummaryCard extends StatelessWidget {
  final String missionValue;
  final String waterValue;
  final String dietValue;

  const SummaryCard({
    super.key,
    required this.missionValue,
    required this.waterValue,
    required this.dietValue,
  });

  @override
  Widget build(BuildContext context) {
    return PrimaryCard(
      child: Column(
        children: [
          SummaryTile(icon: Icons.flag, title: "Missions", value: missionValue),
          const Divider(),
          SummaryTile(
            icon: Icons.water_drop,
            title: "Water",
            value: waterValue,
          ),
          const Divider(),
          SummaryTile(icon: Icons.restaurant, title: "Diet", value: dietValue),
        ],
      ),
    );
  }
}
