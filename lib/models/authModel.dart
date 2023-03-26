class Auth {
  final String password;
  final String email;
  final String? name;

  Auth({required this.password, required this.email, this.name});

  Map<String, dynamic> toJson() {
    return {
      'password': password,
      'email': email,
      'name': name,
    };
  }
}
