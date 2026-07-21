import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shady_os/features/dashboard/screens/dashboard_screen.dart';
import 'package:shady_os/features/mission/screens/mission_screen.dart';
import 'package:shady_os/features/diet/screens/diet_screen.dart';
import 'package:shady_os/features/water/screens/water_screen.dart';
import 'package:shady_os/features/progress/screens/progress_screen.dart';
import 'package:shady_os/features/career/screens/career_screen.dart';

import 'package:shady_os/features/daily_reset/providers/daily_reset_provider.dart';
import 'package:shady_os/features/mission/providers/mission_notifier.dart';
import 'package:shady_os/features/career/providers/career_notifier.dart';
import 'package:shady_os/features/diet/providers/diet_notifier.dart';
import 'package:shady_os/features/water/providers/water_notifier.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  int selectedIndex = 0;

  final List<Widget> pages = const [
    DashboardScreen(),
    MissionScreen(),
    DietScreen(),
    WaterScreen(),
    CareerScreen(),
    ProgressScreen(),
  ];

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _checkDailyReset();
    });
  }

  Future<void> _checkDailyReset() async {
    final resetService = ref.read(dailyResetServiceProvider);

    final shouldReset = await resetService.shouldReset();

    if (!shouldReset) return;

    await ref.read(missionNotifierProvider.notifier).resetAll();

    await ref.read(careerNotifierProvider.notifier).resetAll();

    await ref.read(dietNotifierProvider.notifier).resetAll();

    await ref.read(waterNotifierProvider.notifier).reset();

    await resetService.updateResetDate();

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("🌅 Welcome! Your daily tasks have been reset."),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Dashboard'),
          BottomNavigationBarItem(icon: Icon(Icons.flag), label: 'Mission'),
          BottomNavigationBarItem(icon: Icon(Icons.restaurant), label: 'Diet'),
          BottomNavigationBarItem(icon: Icon(Icons.water_drop), label: 'Water'),
          BottomNavigationBarItem(icon: Icon(Icons.work), label: 'Career'),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Progress',
          ),
        ],
      ),
    );
  }
}
