import 'package:flutter/material.dart';
import 'package:shady_os/core/theme/app_colors.dart';
import 'package:shady_os/features/dashboard/widgets/greeting_section.dart';
import 'package:shady_os/features/dashboard/widgets/progress_card.dart';
import 'package:shady_os/features/dashboard/widgets/summary_card.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: AppBar(title: const Text("Dashboard")),

      body: const SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GreetingSection(),

            SizedBox(height: 25),

            ProgressCard(),

            SizedBox(height: 20),

            SummaryCard(),
          ],
        ),
      ),
    );
  }
}
