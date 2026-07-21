import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/career_task.dart';
import '../providers/career_notifier.dart';
import '../widgets/add_career_dialog.dart';
import '../widgets/career_progress_card.dart';
import '../widgets/career_section.dart';
import '../widgets/career_tile.dart';

class CareerScreen extends ConsumerWidget {
  const CareerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tasks = ref.watch(careerNotifierProvider);

    final completed = tasks.where((task) => task.completed).length;

    final study = tasks.where((e) => e.category == 'Study').toList();
    final projects = tasks.where((e) => e.category == 'Projects').toList();
    final applications = tasks
        .where((e) => e.category == 'Applications')
        .toList();
    final interviews = tasks.where((e) => e.category == 'Interview').toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Career'), centerTitle: true),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          final CareerTask? task = await showDialog<CareerTask>(
            context: context,
            builder: (_) => const AddCareerDialog(),
          );

          if (task != null) {
            await ref.read(careerNotifierProvider.notifier).addTask(task);
          }
        },
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          CareerProgressCard(completed: completed, total: tasks.length),

          _buildSection(context, ref, 'Study', study),

          _buildSection(context, ref, 'Projects', projects),

          _buildSection(context, ref, 'Applications', applications),

          _buildSection(context, ref, 'Interview', interviews),
        ],
      ),
    );
  }

  Widget _buildSection(
    BuildContext context,
    WidgetRef ref,
    String title,
    List<CareerTask> tasks,
  ) {
    if (tasks.isEmpty) {
      return const SizedBox.shrink();
    }

    return CareerSection(
      title: title,
      child: Column(
        children: tasks.map((task) {
          final index = ref.read(careerNotifierProvider).indexOf(task);

          return CareerTile(
            task: task,
            onChanged: () {
              ref.read(careerNotifierProvider.notifier).toggleTask(index);
            },
            onEdit: () async {
              final CareerTask? edited = await showDialog<CareerTask>(
                context: context,
                builder: (_) => AddCareerDialog(task: task),
              );

              if (edited != null) {
                await ref
                    .read(careerNotifierProvider.notifier)
                    .updateTask(index, edited);
              }
            },
            onDelete: () {
              ref.read(careerNotifierProvider.notifier).deleteTask(index);
            },
          );
        }).toList(),
      ),
    );
  }
}
