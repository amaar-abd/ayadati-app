import 'package:ayadati/core/constants/backend_constants.dart';
import 'package:ayadati/core/errors/failures.dart';
import 'package:ayadati/features/appointments/data/data_source/appointments_remote_data_source.dart';
import 'package:ayadati/features/appointments/domain/repos/appointments_repo.dart';
import 'package:ayadati/features/user_booking/domain/entites/appointment_entity.dart';
import 'package:dartz/dartz.dart';

class AppointmentsRepoImpl implements AppointmentsRepo {
  AppointmentsRepoImpl({required this.appointmentsRemoteDataSource});
  final AppointmentsRemoteDataSource appointmentsRemoteDataSource;

  @override
  Future<Either<Failure, List<AppointmentEntity>>> getAppointments(
    String userId,
  ) async {
    try {
      final appointmentModels = await appointmentsRemoteDataSource
          .getRemoteAppointments(userId, BackendConstants.appointments);
      final appointmentEntities = appointmentModels
          .map((model) => model.toAppointmentEntity())
          .toList();
      return right(appointmentEntities);
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> cancelAppointment(
     String bookingId,
  ) async {
    try {
      await appointmentsRemoteDataSource.cancelAppointment(
        bookingId: bookingId,
        path: BackendConstants.appointments,
      );
      return right(null);
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }
}
