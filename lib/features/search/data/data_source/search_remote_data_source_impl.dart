import 'package:ayadati/core/constants/backend_constants.dart';
import 'package:ayadati/core/errors/custom_exception.dart';
import 'package:ayadati/features/home/data/models/doctor_model.dart';
import 'package:ayadati/features/search/data/data_source/search_remote_data_source.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SearchRemoteDataSourceImpl implements SearchRemoteDataSource {
  SearchRemoteDataSourceImpl({required this.firestore});
  final FirebaseFirestore firestore;

  @override
  Future<List<Doctor>> searchDoctors(String query) async {
    try {
      if (query.trim().isEmpty) {
        return [];
      }
      String searchQuery = query.toLowerCase();

      var snapshot = await firestore
          .collection(BackendConstants.doctors)
          .where('searchIndex', arrayContains: searchQuery)
          .get();

      return snapshot.docs
          .map((doc) => Doctor.fromJson(doc.data(), doc.id))
          .toList();
    } on Exception catch (e) {
      throw ServerException(message: e.toString());
    }
  }
}
