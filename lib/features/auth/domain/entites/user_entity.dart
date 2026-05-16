
class UserEntity {
  final String uid;
  final String name;
  final String email;
  final String phone;
  final String? photoUrl; 
  final int? age;      
  final String? gender;

  const UserEntity({
    required this.uid,
    required this.name,
    required this.email,
    required this.phone,
    this.photoUrl,
    this.age, 
    this.gender,
  });
}