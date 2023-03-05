class Event {
  final String name;
  final String date;
  final String imageUrl;
  final String location;
  final String category;
  final String going;
  final String venue;
  final List<String> images;
  final String description;
  final String time;

  Event({
    required this.name,
    required this.date,
    required this.imageUrl,
    required this.location,
    required this.category,
    required this.going,
    required this.images,
    required this.description,
    required this.time,
    required this.venue,
  });
}
