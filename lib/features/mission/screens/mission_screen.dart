import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// import '../models/mission.dart';
import '../providers/mission_notifier.dart';
import '../widgets/add_mission_dialog.dart';
import '../widgets/edit_mission_dialog.dart';
import '../widgets/mission_section.dart';
import '../widgets/mission_tile.dart';

class MissionScreen extends ConsumerWidget {
  const MissionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final missions = ref.watch(missionNotifierProvider);

    final categories =
        missions.map((mission) => mission.category).toSet().toList()..sort();

    return Scaffold(
      appBar: AppBar(title: const Text("Mission")),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (_) => const AddMissionDialog(),
          );
        },
        child: const Icon(Icons.add),
      ),

      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];

          final categoryMissions = missions
              .where((m) => m.category == category)
              .toList();

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MissionSection(title: category),

              const SizedBox(height: 10),

              ...categoryMissions.map(
                (mission) => Dismissible(
                  key: ValueKey(mission.id),

                  direction: DismissDirection.endToStart,

                  background: Container(
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: const Icon(Icons.delete, color: Colors.white),
                  ),

                  confirmDismiss: (_) async {
                    return await showDialog<bool>(
                          context: context,
                          builder: (_) => AlertDialog(
                            title: const Text("Delete Mission"),
                            content: Text("Delete '${mission.title}'?"),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context, false);
                                },
                                child: const Text("Cancel"),
                              ),
                              FilledButton(
                                onPressed: () {
                                  Navigator.pop(context, true);
                                },
                                child: const Text("Delete"),
                              ),
                            ],
                          ),
                        ) ??
                        false;
                  },

                  onDismissed: (_) {
                    ref
                        .read(missionNotifierProvider.notifier)
                        .deleteMission(mission.id);

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Mission deleted")),
                    );
                  },

                  child: MissionTile(
                    mission: mission,

                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (_) => EditMissionDialog(mission: mission),
                      );
                    },

                    onChanged: (_) {
                      ref
                          .read(missionNotifierProvider.notifier)
                          .toggleMission(mission.id);
                    },
                  ),
                ),
              ),

              const SizedBox(height: 20),
            ],
          );
        },
      ),
    );
  }
}
