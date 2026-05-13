import 'package:ayadati/features/home/domain/entites/doctor_entity.dart'
    show DoctorEntity;

class SuccessEntity {
  final DoctorEntity doctor;
  final DateTime selectedDate;
  final String selectedTime;

  const SuccessEntity({
    required this.doctor,
    required this.selectedDate,
    required this.selectedTime,
  });
}
