import 'package:ayadati/features/home/data/models/doctor_model.dart';

abstract class FirebaseDataSource {
  Future<List<Doctor>> getData({required String path,String? city, String? specialty});
}
