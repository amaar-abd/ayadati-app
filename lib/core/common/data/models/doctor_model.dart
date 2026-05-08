import 'package:ayadati/core/common/domain/entites/doctor_entity.dart';

class Doctor extends DoctorEntity {
  Doctor({
    required super.name,
    required super.image,
    required super.desc,
    required super.city,
    required super.address,
    required super.isrecommended,
    required super.rating,
    required super.fess,
    required super.specialty,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      name: json['name'],
      image: json['image'],
      desc: json['desc'],
      city: json['city'],
      address: json['address'],
      isrecommended: json['is_recommended'],
      rating: json['rating'],
      fess: json['fess'],
      specialty: json['specialty'],
    );
  }
  Map<String, dynamic> doctorToJson() {
    return {
      'name': name,
      'image': image,
      'desc': desc,
      'city': city,
      'address': address,
      'is_recommended': isrecommended,
      'rating': rating,
      'fess': fess,
      'specialty': specialty,
    };
  }
}
