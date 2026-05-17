import 'package:ayadati/core/errors/failures.dart';
import 'package:ayadati/core/common/domain/entites/user_entity.dart';
import 'package:ayadati/features/profile/domain/repo/profile_repositotry.dart';
import 'package:dartz/dartz.dart';

class UpdateUserProfileUseCase {
  UpdateUserProfileUseCase({required this.profileRepositotry});
  final ProfileRepositotry profileRepositotry;

  Future<Either<Failure, void>> call(UserEntity userEntity) async {
    return await profileRepositotry.updateUserProfile(userEntity);
  }
}
