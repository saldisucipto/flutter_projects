/// Model User
class User {
  int? id;
  final String name;
  final String email;
  final int password;
  final int phoneNumber;

  User({
    this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.phoneNumber,
  });

  // from Map Constructoor
  factory User.fromMap(Map<String, dynamic> data) {
    return User(
      name: data['name'],
      email: data['email'],
      password: data['password'],
      phoneNumber: data['phoneNumber'],
    );
  }

  // override function
  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": name,
      "email": email,
      "password": password,
      "phoneNumber": phoneNumber,
    };
  }
}
