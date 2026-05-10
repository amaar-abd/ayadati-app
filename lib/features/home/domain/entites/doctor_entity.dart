class DoctorEntity {
  final String doctorId;
  final String name;
  final String image;
  final String desc;
  final String city;
  final String address;
  final bool isrecommended;
  final String rating;
  final double fees;
  final String specialty;

  const DoctorEntity({
    required this.doctorId,
    required this.name,
    required this.image,
    required this.desc,
    required this.city,
    required this.address,
    required this.isrecommended,
    required this.rating,
    required this.fees,
    required this.specialty,
  });
}
