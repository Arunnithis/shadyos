import 'package:flutter/material.dart';
import 'package:shady_os/core/widgets/dashboard_card.dart';

class SummaryCard extends StatelessWidget {
  const SummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return DashboardCard(
      child: const Column(
        children: [
          ListTile(
            leading: Icon(Icons.flag),
            title: Text("Mission"),
            trailing: Text("0 / 9"),
          ),

          Divider(),

          ListTile(
            leading: Icon(Icons.restaurant),
            title: Text("Diet"),
            trailing: Text("0%"),
          ),

          Divider(),

          ListTile(
            leading: Icon(Icons.water_drop),
            title: Text("Water"),
            trailing: Text("0 / 6"),
          ),
        ],
      ),
    );
  }
}
