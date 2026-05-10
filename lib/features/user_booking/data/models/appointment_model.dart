import 'package:ayadati/features/user_booking/domain/entites/appointment_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AppointmentModel extends AppointmentEntity {
  AppointmentModel({
    required super.userId,
    required super.doctorId,
    required super.doctorName,
    required super.bookingId,
    required super.image,
    required super.city,
    required super.address,
    required super.fees,
    required super.specialty,
    required super.status,
    required super.appointmentDate,
  });

  factory AppointmentModel.fromJson(Map<String, dynamic> json) {
    return AppointmentModel(
      userId: json['userId'] ?? '',
      doctorId: json['doctor_id'] ?? '',
      doctorName: json['doctor_name'] ?? '',
      bookingId: json['booking_id'] ?? '',
      image: json['image'] ?? '',
      city: json['city'] ?? '',
      address: json['address'] ?? '',
      fees: (json['fees'] ?? 0).toDouble(),
      specialty: json['specialty'] ?? '',
      status: json['status'] ?? '',
      appointmentDate: (json['appointment_date'] as Timestamp).toDate(),
    );
  }

factory AppointmentModel.fromEntity(AppointmentEntity entity) {
  return AppointmentModel(
    userId: entity.userId,
    doctorId: entity.doctorId,
    doctorName: entity.doctorName,
    bookingId: entity.bookingId,
    image: entity.image,
    city: entity.city,
    address: entity.address,
    fees: entity.fees,
    specialty: entity.specialty,
    status: entity.status,
    appointmentDate: entity.appointmentDate,
  );
}
  Map<String, dynamic> appoinmentToJson() {
    return {
      'userId':userId,
      'doctor_id':doctorId,
      'doctor_name':doctorName,
      'booking_id':bookingId,
      'image':image,  
      'city':city,
      'address':address,
      'fees':fees,
      'specialty':specialty,
      'status':status,
      'appointment_date':appointmentDate,
    };
  }
}
