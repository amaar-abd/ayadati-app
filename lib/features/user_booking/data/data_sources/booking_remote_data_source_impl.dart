import 'package:ayadati/features/user_booking/data/data_sources/booking_remote_data_source.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BookingRemoteDataSourceImpl implements BookingRemoteDataSource {
  BookingRemoteDataSourceImpl({required this.firestore});
  final FirebaseFirestore firestore;

  @override
  Future<void> addAppointment({
    required Map<String, dynamic> data,
    required String path,
  }) async {
    try {
      String customId = "${data['userId']}_${data['doctor_id']}";

      final docRef = firestore.collection(path).doc(customId);

      data['booking_id'] = customId;

      await docRef.set(data, SetOptions(merge: true));

    } catch (e) {
      rethrow;
    }
  }
}
