
class UserEntity {
  final String uid;
  final String name;
  final String email;
  final String phone;
  final String? photoUrl; 

  const UserEntity({
    required this.uid,
    required this.name,
    required this.email,
    required this.phone,
    this.photoUrl,
  });
}