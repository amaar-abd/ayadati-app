import 'package:ayadati/features/home/data/datasources/firebase_data_source.dart';
import 'package:ayadati/features/home/data/models/doctor_model.dart';
import 'package:ayadati/core/errors/custom_exception.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseDataSourceImpl implements FirebaseDataSource {
  const FirebaseDataSourceImpl({required this.firestore});
  final FirebaseFirestore firestore;

  @override
  Future<List<Doctor>> getData({
    required String path,
    String? city,
    String? specialty,
  }) async {
    try {
      Query query = firestore.collection(path);
      if (city != null) {
        query = query.where('city', isEqualTo: city);
      }
      if (specialty != null) {
        query = query.where('specialty', isEqualTo: specialty);
      }
      final response = await query.get();
      return response.docs
          .map((doc) => Doctor.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }
}
