class Event {
  final String name;
  final String date;
  final String imageUrl;
  final String location;
  final String category;
  final String going;
  final List<String> images;

  Event({
    required this.name,
    required this.date,
    required this.imageUrl,
    required this.location,
    required this.category,
    required this.going,
    required this.images,
  });
}
