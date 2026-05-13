import 'package:ayadati/core/errors/failures.dart';
import 'package:ayadati/features/home/domain/entites/doctor_entity.dart';
import 'package:dartz/dartz.dart';

abstract class SearchRepo {
  Future<Either<Failure, List<DoctorEntity>>> searchDoctors(String query);
}
