class Expanse {
  final int id;
  final String title;
  final double ammount;
  final DateTime date;
  final String category;

  // constructor
  Expanse({
    required this.id,
    required this.title,
    required this.ammount,
    required this.date,
    required this.category,
  });

  // Expanse to Map
  Map<String, dynamic> toMap() => {
        'title': title,
        'ammount': ammount,
        'date': date.toString(),
        'category': category,
      };

  // Map to Expanse
  factory Expanse.fromString(Map<String, dynamic> value) => Expanse(
        id: value['id'],
        title: value['title'],
        ammount: double.parse(value["ammount"]),
        date: DateTime.parse(value["date"]),
        category: value["category"],
      );
}
