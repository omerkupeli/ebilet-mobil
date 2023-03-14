class Events {
  final String id;
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

  Events({
    required this.id,
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

  factory Events.fromJson(Map<String, dynamic> json) {
    return Events(
      id: json['id'],
      name: json['name'],
      date: json['date'],
      imageUrl: json['image_url'],
      location: json['location'],
      category: json['category'],
      going: json['going'],
      images: json['images'],
      description: json['description'],
      time: json['time'],
      venue: json['venue'],
    );
  }
}
