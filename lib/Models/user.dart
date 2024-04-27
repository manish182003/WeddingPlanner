class User {
  String username;
  String password;
  String token;

  User({
    required this.username,
    required this.password,
    this.token = '',
  });

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'password': password,
      'token': token,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      username: map['username'] ?? '',
      password: map['password'] ?? '',
      token: '',
    );
  }
}
