import 'package:ayadati/core/errors/failures.dart';
import 'package:ayadati/features/appointments/domain/repos/appointments_repo.dart';
import 'package:dartz/dartz.dart';

class CancelAppointmentUseCase {
  CancelAppointmentUseCase({required this.appointmentsRepo});
  final AppointmentsRepo appointmentsRepo;


  Future<Either<Failure, void>> call( {required String bookingId}) {
    
    return appointmentsRepo.cancelAppointment(bookingId);
  }
}
