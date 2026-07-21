class Quote {
  final String text;
  final String author;

  const Quote({required this.text, required this.author});
}

class QuoteRepository {
  static const List<Quote> quotes = [
    Quote(
      text:
          "Discipline is choosing between what you want now and what you want most.",
      author: "Abraham Lincoln",
    ),
    Quote(
      text: "Success is the sum of small efforts repeated every day.",
      author: "Robert Collier",
    ),
    Quote(
      text: "Motivation gets you started. Discipline keeps you going.",
      author: "Jim Ryun",
    ),
    Quote(text: "Small progress is still progress.", author: "Shady OS"),
    Quote(
      text: "Every completed task builds the person you want to become.",
      author: "Shady OS",
    ),
    Quote(text: "Consistency beats intensity.", author: "Shady OS"),
    Quote(
      text: "The future depends on what you do today.",
      author: "Mahatma Gandhi",
    ),
    Quote(text: "Dreams work only when you do.", author: "John C. Maxwell"),
    Quote(text: "Your habits create your future.", author: "Shady OS"),
    Quote(text: "Discipline is freedom.", author: "Jocko Willink"),
  ];
}
