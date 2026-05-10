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
      final response = await firestore.collection(path).add(data);
      await response.update({'booking_id': response.id});
    } catch (e) {
      rethrow;
    }
  }
}
