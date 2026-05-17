import 'package:ayadati/core/errors/failures.dart';
import 'package:ayadati/core/common/domain/entites/user_entity.dart';
import 'package:dartz/dartz.dart';

abstract class ProfileRepositotry {
  Future<Either<Failure, UserEntity>> getUserProfile(String userId);
  Future<Either<Failure, void>> updateUserProfile(UserEntity userModel);
  
}
