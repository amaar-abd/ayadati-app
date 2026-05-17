import 'package:ayadati/core/common/domain/entites/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    required super.uid,
    required super.name,
    required super.email,
     super.phone,
    super.photoUrl,
    super.age,
    super.gender,
    super.address,
  });
  factory UserModel.fromEntity(UserEntity user) {
    return UserModel(
      uid: user.uid,
      name: user.name,
      email: user.email,
      phone: user.phone,
      address: user.address,
      age: user.age,
      gender: user.gender,
      photoUrl: user.photoUrl,
    );
  }
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      phone: map['phone'] ?? '',
      photoUrl: map['photoUrl'] ?? '',
      age: map['age'],
      gender: map['gender'],
      address: map['address'],
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
      'address': address,
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

      address: address,
    );
  }
}
