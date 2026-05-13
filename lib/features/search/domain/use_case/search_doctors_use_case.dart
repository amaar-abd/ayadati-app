import 'package:ayadati/core/errors/failures.dart';
import 'package:ayadati/features/home/domain/entites/doctor_entity.dart';
import 'package:ayadati/features/search/domain/repos/search_repo.dart';
import 'package:dartz/dartz.dart';

class SearchDoctorsUseCase {
  final SearchRepo repository;
  SearchDoctorsUseCase(this.repository);

  Future<Either<Failure, List<DoctorEntity>>> call(String query) {
    return repository.searchDoctors(query);
  }
}