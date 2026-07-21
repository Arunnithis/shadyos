class LevelUtils {
  LevelUtils._();

  static int xpForLevel(int level) {
    return 100 + ((level - 1) * 50);
  }

  static int calculateLevel(int totalXp) {
    int level = 1;
    int xp = totalXp;

    while (xp >= xpForLevel(level)) {
      xp -= xpForLevel(level);
      level++;
    }

    return level;
  }

  static int currentLevelXp(int totalXp) {
    int level = calculateLevel(totalXp);
    int xp = totalXp;

    for (int i = 1; i < level; i++) {
      xp -= xpForLevel(i);
    }

    return xp;
  }

  static int nextLevelXp(int totalXp) {
    return xpForLevel(calculateLevel(totalXp));
  }

  static double progress(int totalXp) {
    return currentLevelXp(totalXp) / nextLevelXp(totalXp);
  }
}
