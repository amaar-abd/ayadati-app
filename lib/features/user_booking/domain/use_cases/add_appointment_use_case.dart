import 'package:ayadati/core/errors/failures.dart';
import 'package:ayadati/features/user_booking/domain/entites/appointment_entity.dart';
import 'package:ayadati/features/user_booking/domain/repo/booking_repo.dart';
import 'package:dartz/dartz.dart';

class AddAppointmentUseCase {
  final BookingRepo bookingRepo;

  AddAppointmentUseCase({required this.bookingRepo});

  Future<Either<Failure, void>> call(AppointmentEntity appointment) async {
    return await bookingRepo.addAppointment(appointment: appointment);
  }
}
