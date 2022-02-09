class User {
  int id;
  String name;
  String email;
  String phone;

  User({
    required this.id,
    required this.email,
    required this.phone,
    required this.name,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      email: json['email'],
      phone: json['phone'],
      name: json['name'],
    );
  }
}
