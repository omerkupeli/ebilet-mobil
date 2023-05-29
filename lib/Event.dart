class Event {
  final String name;
  final String date;
  final String duration;
  final String imageUrl;
  final String location;
  final String tags;
  final List<String> status;
  final String description;

  Event({
    required this.name,
    required this.date,
    required this.imageUrl,
    required this.location,
    required this.tags,
    required this.status,
    required this.description,
    required this.duration,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      name: json['name'],
      date: json['date'],
      imageUrl: json['imageUrl'],
      location: json['location'],
      tags: json['tags'],
      status: json['status'],
      description: json['description'],
      duration: json['duration'],
    );
  }

  //to json
  Map<String, dynamic> toJson() => {
        'name': name,
        'date': date,
        'imageUrl': imageUrl,
        'location': location,
        'tags': tags,
        'status': status,
        'description': description,
        'duration': duration,
      };
}
