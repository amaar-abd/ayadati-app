import 'package:ayadati/features/home/domain/entites/doctor_entity.dart';
import 'package:ayadati/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class DoctorRepository {
  Future<Either<Failure, List<DoctorEntity>>> getDoctors({
    String? city,
    String? specialty,
  });
}