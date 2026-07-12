import 'package:flutter/material.dart';
import 'package:shady_os/core/screens/home_screen.dart';
import 'package:shady_os/core/theme/app_theme.dart';
import 'package:shady_os/core/storage/hive_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await HiveService.init();

  runApp(const ProviderScope(child: ShadyOS()));
}

class ShadyOS extends StatelessWidget {
  const ShadyOS({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shady OS',
      theme: AppTheme.darkTheme,
      home: const HomeScreen(),
    );
  }
}
