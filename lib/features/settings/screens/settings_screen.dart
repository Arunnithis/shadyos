import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/settings_notifier.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingsNotifierProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("Settings"), centerTitle: true),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.water_drop),
            title: const Text("Daily Water Goal"),
            subtitle: Text("${settings.waterGoal} glasses"),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              _showWaterGoalDialog(context, ref, settings.waterGoal);
            },
          ),

          const Divider(),

          SwitchListTile(
            secondary: const Icon(Icons.notifications),
            title: const Text("Notifications"),
            value: settings.notificationsEnabled,
            onChanged: (value) {
              ref
                  .read(settingsNotifierProvider.notifier)
                  .updateNotifications(value);
            },
          ),

          const Divider(),

          ListTile(
            leading: const Icon(Icons.dark_mode),
            title: const Text("Theme"),
            subtitle: Text(settings.darkMode ? "Dark" : "Light"),
            trailing: const Text("Coming Soon"),
          ),
        ],
      ),
    );
  }

  void _showWaterGoalDialog(
    BuildContext context,
    WidgetRef ref,
    int currentGoal,
  ) {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text("Select Daily Water Goal"),
          content: StatefulBuilder(
            builder: (context, setState) {
              int selectedGoal = currentGoal;

              return SizedBox(
                width: double.maxFinite,
                child: RadioGroup<int>(
                  groupValue: selectedGoal,
                  onChanged: (value) {
                    if (value == null) return;

                    setState(() {
                      selectedGoal = value;
                    });

                    ref
                        .read(settingsNotifierProvider.notifier)
                        .updateWaterGoal(value);

                    Navigator.pop(context);
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(11, (index) {
                      final goal = index + 4;

                      return RadioListTile<int>(
                        value: goal,
                        title: Text("$goal glasses"),
                      );
                    }),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
