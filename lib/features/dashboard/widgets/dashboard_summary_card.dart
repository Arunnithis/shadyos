import 'package:flutter/material.dart';
import 'package:shady_os/core/widgets/primary_card.dart';
import 'package:shady_os/core/widgets/summary_tile.dart';

class DashboardSummaryCard extends StatelessWidget {
  final int completedMissions;
  final int totalMissions;

  const DashboardSummaryCard({
    super.key,
    required this.completedMissions,
    required this.totalMissions,
  });

  @override
  Widget build(BuildContext context) {
    return PrimaryCard(
      child: Column(
        children: [
          SummaryTile(
            icon: Icons.flag,
            title: "Missions",
            value: "$completedMissions / $totalMissions",
          ),

          const Divider(),

          const SummaryTile(
            icon: Icons.water_drop,
            title: "Water",
            value: "0 / 6",
          ),

          const Divider(),

          const SummaryTile(icon: Icons.restaurant, title: "Diet", value: "0%"),
        ],
      ),
    );
  }
}
