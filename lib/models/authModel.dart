class Auth {
  final String password;
  final String email;

  Auth({required this.password, required this.email});

  Map<String, dynamic> toJson() {
    return {
      'password': password,
      'email': email,
    };
  }
}
