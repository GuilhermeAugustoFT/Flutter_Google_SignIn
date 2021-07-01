import 'dart:convert';

class User {
  String name;
  String email;
  String photoURL;
  User({
    required this.name,
    required this.email,
    required this.photoURL,
  });

  User userFromJson(String str) => User.fromJson(json.decode(str));

  String getName() {
    return this.name;
  }

  String getEmail() {
    return this.email;
  }

  String getPhotoURL() {
    return this.photoURL;
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'photoURL': photoURL,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      name: map['name'],
      email: map['email'],
      photoURL: map['photoURL'],
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));
}
