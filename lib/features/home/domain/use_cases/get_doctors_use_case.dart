import 'package:ayadati/features/home/domain/entites/doctor_entity.dart';
import 'package:ayadati/features/home/domain/repo/doctor_repository.dart';
import 'package:ayadati/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

class GetDoctorsUseCase {
  GetDoctorsUseCase({required this.repository});
  final DoctorRepository repository;

  Future<Either<Failure, List<DoctorEntity>>> call({
    String? city,
    String? specialty,
  }) async {
    return await repository.getDoctors(city: city, specialty: specialty);
  }
}
