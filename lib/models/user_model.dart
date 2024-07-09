import 'dart:convert';

class User {
  String name;
  String email;
  String phone;
  String profileUrl;
  String gender;
  User({
    required this.name,
    required this.email,
    required this.phone,
    required this.profileUrl,
    required this.gender,
  });
  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'phone': phone,
      'profileUrl': profileUrl,
      'gender': gender,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      name: map['name'] as String,
      email: map['email'] as String,
      phone: map['phone'] as String,
      profileUrl: map['profileUrl'] as String,
      gender: map['gender'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source) as Map<String, dynamic>);

  User copyWith({
    String? name,
    String? email,
    String? phone,
    String? profileUrl,
    String? gender,
  }) {
    return User(
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      profileUrl: profileUrl ?? this.profileUrl,
      gender: gender ?? this.gender,
    );
  }

  @override
  String toString() {
    return 'User(name: $name, email: $email, phone: $phone, profileUrl: $profileUrl, gender: $gender)';
  }

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.email == email &&
      other.phone == phone &&
      other.profileUrl == profileUrl &&
      other.gender == gender;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      email.hashCode ^
      phone.hashCode ^
      profileUrl.hashCode ^
      gender.hashCode;
  }
}
