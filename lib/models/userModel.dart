class User {
  final String password;
  final String email;

  User({required this.password, required this.email});

  Map<String, dynamic> toJson() {
    return {
      'password': password,
      'email': email,
    };
  }
}
