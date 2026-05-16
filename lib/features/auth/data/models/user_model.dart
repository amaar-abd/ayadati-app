import 'package:ayadati/features/auth/domain/entites/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    required super.uid,
    required super.name,
    required super.email,
    required super.phone,
    super.photoUrl,
    super.age,
    super.gender,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      phone: map['phone'] ?? '',
      photoUrl: map['photoUrl'] ?? '',
      age: map['age'],
      gender: map['gender'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'phone': phone,
      'photoUrl': photoUrl,
      'age': age,
      'gender': gender,
    };
  }

  UserEntity toUserEntity() {
    return UserEntity(
      uid: uid,
      name: name,
      email: email,
      phone: phone,
      photoUrl: photoUrl,
      age: age,
      gender: gender,
    );
  }
}
