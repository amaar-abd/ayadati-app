import 'package:ayadati/core/constants/backend_constants.dart';
import 'package:ayadati/core/errors/custom_exception.dart';
import 'package:ayadati/core/errors/failures.dart';
import 'package:ayadati/features/auth/domain/entites/user_entity.dart';
import 'package:ayadati/features/profile/data/data_source/profile_remote_data_source.dart';
import 'package:ayadati/features/profile/domain/repo/profile_repositotry.dart';
import 'package:dartz/dartz.dart';

class ProfileRepositotryImpl implements ProfileRepositotry {
  ProfileRepositotryImpl({required this.profileRemoteDataSource});
  final ProfileRemoteDataSource profileRemoteDataSource;

  @override
  Future<Either<Failure, UserEntity>> getUserProfile(String userId) async {
    try {
      final userData = await profileRemoteDataSource.getUserProfile(
        userId,
        BackendConstants.users,
      );
      return right(userData.toUserEntity());
    } on ServerException catch (e) {
      return left(ServerFailure(message: e.toString()));
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }
}
