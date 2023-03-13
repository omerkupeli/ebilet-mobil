class User {
  String name;
  String email;
  String? token;

  User({required this.name, required this.email, this.token});

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'token': token,
    };
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      email: json['email'],
      token: json['token'],
    );
  }
}
