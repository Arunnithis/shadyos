import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/water_repository.dart';
import '../models/water.dart';

final waterRepositoryProvider = Provider<WaterRepository>((ref) {
  return WaterRepository();
});

final waterNotifierProvider = StateNotifierProvider<WaterNotifier, Water>((
  ref,
) {
  return WaterNotifier(ref.read(waterRepositoryProvider));
});

class WaterNotifier extends StateNotifier<Water> {
  WaterNotifier(this._repository) : super(const Water(glasses: 0)) {
    load();
  }

  final WaterRepository _repository;

  void load() {
    state = _repository.loadWater();
  }

  Future<void> addGlass() async {
    if (state.glasses >= 6) return;

    state = state.copyWith(glasses: state.glasses + 1);

    await _repository.saveWater(state);
  }

  Future<void> reset() async {
    state = const Water(glasses: 0);

    await _repository.reset();
  }
}
