import 'package:flutter/foundation.dart' show immutable;

/// Model User

@immutable
class User {
  final int id;
  final String name;
  final String email;
  final int password;
  final int phoneNumber;

  const User({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.phoneNumber,
  });

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
