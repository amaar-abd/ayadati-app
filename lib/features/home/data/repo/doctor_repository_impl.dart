import 'package:ayadati/features/home/data/datasources/firebase_data_source.dart';
import 'package:ayadati/features/home/domain/entites/doctor_entity.dart';
import 'package:ayadati/features/home/domain/repo/doctor_repository.dart';
import 'package:ayadati/core/constants/backend_constants.dart';
import 'package:ayadati/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

class DoctorRepositoryImpl implements DoctorRepository {
  DoctorRepositoryImpl({required this.firebaseDataSource});
  final FirebaseDataSource firebaseDataSource;

  @override
  Future<Either<Failure, List<DoctorEntity>>> getDoctors({
    String? city,
    String? specialty,
  }) async {
    try {
      final doctors = await firebaseDataSource.getData(
        path: BackendConstants.doctors,
        city: city,
        specialty: specialty,
      );
      return right(doctors.map((item) => item.toDoctorEntity()).toList());
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }
}
