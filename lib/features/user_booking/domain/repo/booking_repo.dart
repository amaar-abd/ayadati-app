import 'package:ayadati/core/errors/failures.dart';
import 'package:ayadati/features/user_booking/domain/entites/appointment_entity.dart';
import 'package:dartz/dartz.dart';

abstract class BookingRepo {
  Future<Either<Failure,void>> addAppointment({
   required AppointmentEntity appointment,
     String path,
  });
}