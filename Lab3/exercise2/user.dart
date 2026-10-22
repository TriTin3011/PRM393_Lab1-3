class User {
  final String name;
  final String email;

  User({
    required this.name,
    required this.email,
  });

  //chuyển JSON thành object User
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      email: json['email'],
    );
  }

  @override
  String toString() {
    return 'User: \nname: $name \nemail: $email';
  }
}