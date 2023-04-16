class User {
  final int id;
  final String name;
  final String email;
  final String? image;
  final String created_at;
  final String? phone;

  User(
      {required this.id,
      required this.name,
      required this.email,
      required this.image,
      required this.created_at,
      required this.phone});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      image: json['image'],
      created_at: json['created_at'],
      phone: json['phone'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'password': name,
      'email': email,
      'name': name,
      'created_at': created_at,
      'phone': phone,
    };
  }
}
