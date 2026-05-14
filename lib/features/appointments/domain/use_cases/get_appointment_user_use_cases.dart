import 'package:ayadati/core/errors/failures.dart';
import 'package:ayadati/features/appointments/domain/repos/appointments_repo.dart';
import 'package:ayadati/features/user_booking/domain/entites/appointment_entity.dart';
import 'package:dartz/dartz.dart';

class GetAppointmentUserUseCases {
  final AppointmentsRepo appointmentsRepo;

  GetAppointmentUserUseCases({required this.appointmentsRepo});

  Future<Either<Failure, List<AppointmentEntity>>> call(String userId) async {
   return await appointmentsRepo.getAppointments(userId);
  }
}
