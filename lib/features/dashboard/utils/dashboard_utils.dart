import 'dart:math';

import '../models/quote.dart';

class DashboardUtils {
  static String greeting() {
    final hour = DateTime.now().hour;

    if (hour >= 5 && hour < 12) {
      return "Good Morning";
    }

    if (hour >= 12 && hour < 17) {
      return "Good Afternoon";
    }

    return "Good Evening";
  }

  static Quote randomQuote() {
    final random = Random();
    return QuoteRepository.quotes[random.nextInt(
      QuoteRepository.quotes.length,
    )];
  }

  static double calculateDisciplineScore({
    required double mission,
    required double career,
    required double diet,
    required double water,
  }) {
    return ((mission * 0.30) + (career * 0.30) + (diet * 0.20) + (water * 0.20))
        .clamp(0, 100);
  }

  static String scoreLabel(double score) {
    if (score >= 90) return "Legendary";
    if (score >= 80) return "Excellent";
    if (score >= 70) return "Great";
    if (score >= 60) return "Good";
    if (score >= 40) return "Average";
    return "Needs Improvement";
  }
}
