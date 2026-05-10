import 'package:ayadati/core/constants/backend_constants.dart';
import 'package:ayadati/core/errors/failures.dart';
import 'package:ayadati/features/user_booking/data/data_sources/booking_remote_data_source.dart';
import 'package:ayadati/features/user_booking/data/models/appointment_model.dart';
import 'package:ayadati/features/user_booking/domain/entites/appointment_entity.dart';
import 'package:ayadati/features/user_booking/domain/repo/booking_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

class BookingRepoImpl implements BookingRepo {
  final BookingRemoteDataSource bookingRemoteDataSource;

  BookingRepoImpl({required this.bookingRemoteDataSource});
  @override
  Future<Either<Failure, void>> addAppointment({
    required AppointmentEntity appointment,
    String? path,
  }) async {
    try {
      final model = AppointmentModel.fromEntity(appointment);
      await bookingRemoteDataSource.addAppointment(
        data: model.appoinmentToJson(),
        path: BackendConstants.appointments,
      );
      return right(null);
    } on FirebaseException catch (e) {
      return left(ServerFailure(message: e.toString()));
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }
}
