import 'package:ayadati/features/home/domain/entites/doctor_entity.dart';

class Doctor extends DoctorEntity {
  Doctor({
    required super.name,
    required super.image,
    required super.desc,
    required super.city,
    required super.address,
    required super.isrecommended,
    required super.rating,
    required super.fees,
    required super.specialty,
    required super.doctorId,
  });

  factory Doctor.fromJson(Map<String, dynamic> json,String documentId) {
    return Doctor(
      doctorId: documentId,
      name: json['name']?? '',
      image: json['image']?? '',
      desc: json['desc']?? '',
      city: json['city']?? '',
      address: json['address']?? '',
      isrecommended: json['is_recommended']?? false,
      rating: json['rating']?.toString()??'0.0',
      fees: json['fees']?? '',
      specialty: json['specialty']?? '',
    );
  }
  Map<String, dynamic> doctorToJson() {
    return {
      'documentId':doctorId,
      'name': name,
      'image': image,
      'desc': desc,
      'city': city,
      'address': address,
      'is_recommended': isrecommended,
      'rating': rating,
      'fees': fees,
      'specialty': specialty,
    };
  }

  DoctorEntity toDoctorEntity() {
    return DoctorEntity(
      doctorId: doctorId,
      name: name,
      image: image,
      desc: desc,
      city: city,
      address: address,
      isrecommended: isrecommended,
      rating: rating,
      fees: fees,
      specialty: specialty,
    );
  }
}
