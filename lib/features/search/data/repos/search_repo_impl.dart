import 'package:ayadati/core/errors/failures.dart';
import 'package:ayadati/features/home/domain/entites/doctor_entity.dart';
import 'package:ayadati/features/search/data/data_source/search_remote_data_source.dart';
import 'package:ayadati/features/search/domain/repos/search_repo.dart';
import 'package:dartz/dartz.dart';

class SearchRepoImpl implements SearchRepo {
  SearchRepoImpl({required this.remoteDataSource});
  final SearchRemoteDataSource remoteDataSource;

  @override
  Future<Either<Failure, List<DoctorEntity>>> searchDoctors(
    String query,
  ) async {
    try {
      final doctors = await remoteDataSource.searchDoctors(query);
      return Right(doctors);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
