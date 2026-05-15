import 'package:ayadati/core/errors/custom_exception.dart';
import 'package:ayadati/features/appointments/data/data_source/appointments_remote_data_source.dart';
import 'package:ayadati/features/user_booking/data/models/appointment_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AppointmentsRemoteDataSourceImpl implements AppointmentsRemoteDataSource {
  AppointmentsRemoteDataSourceImpl({required this.firestore});
  final FirebaseFirestore firestore;

  @override
  Future<List<AppointmentModel>> getRemoteAppointments(
    String userId,
    String path,
  ) async {
    try {
      final querySnapshot = await firestore
          .collection(path)
          .where('userId', isEqualTo: userId)
          .orderBy('appointment_date', descending: true)
          .get();
      return querySnapshot.docs
          .map((doc) => AppointmentModel.fromJson(doc.data()))
          .toList();
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<void> cancelAppointment({
    required String bookingId,
    required String path,
  }) async {
    try {
      await firestore.collection(path).doc(bookingId).delete();
    } catch (e) {
      ServerException(message: e.toString());
    }
  }
}
