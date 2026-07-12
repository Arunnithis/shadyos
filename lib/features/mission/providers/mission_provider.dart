import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/mission_repository.dart';

final missionRepositoryProvider = Provider<MissionRepository>(
  (ref) => MissionRepository(),
);
