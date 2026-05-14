import 'package:ayadati/core/errors/failures.dart';
import 'package:ayadati/features/user_booking/domain/entites/appointment_entity.dart';
import 'package:dartz/dartz.dart';

abstract class AppointmentsRepo  {
  Future<Either<Failure, List<AppointmentEntity>>> getAppointments(String userId);
}