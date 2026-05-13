import 'package:ayadati/features/home/data/models/doctor_model.dart';

abstract class SearchRemoteDataSource {
  Future<List<Doctor>> searchDoctors(String query);
}
