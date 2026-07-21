import 'career_task.dart';

class CareerData {
  static List<CareerTask> defaultTasks() {
    final now = DateTime.now();

    return [
      // Study
      CareerTask(
        id: '1',
        title: 'Study Playwright',
        category: 'Study',
        createdAt: now,
      ),
      CareerTask(
        id: '2',
        title: 'Practice Python',
        category: 'Study',
        createdAt: now,
      ),
      CareerTask(
        id: '3',
        title: 'Revise SQL',
        category: 'Study',
        createdAt: now,
      ),

      // Projects
      CareerTask(
        id: '4',
        title: 'Build Shady OS',
        category: 'Projects',
        createdAt: now,
      ),
      CareerTask(
        id: '5',
        title: 'Automation Framework',
        category: 'Projects',
        createdAt: now,
      ),

      // Applications
      CareerTask(
        id: '6',
        title: 'Apply to Google',
        category: 'Applications',
        createdAt: now,
      ),
      CareerTask(
        id: '7',
        title: 'Apply to Microsoft',
        category: 'Applications',
        createdAt: now,
      ),

      // Interview
      CareerTask(
        id: '8',
        title: 'HR Interview',
        category: 'Interview',
        createdAt: now,
      ),
      CareerTask(
        id: '9',
        title: 'Technical Revision',
        category: 'Interview',
        createdAt: now,
      ),
    ];
  }
}
