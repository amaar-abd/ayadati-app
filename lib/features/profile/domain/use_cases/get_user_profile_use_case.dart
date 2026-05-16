import 'package:ayadati/core/errors/failures.dart';
import 'package:ayadati/features/auth/domain/entites/user_entity.dart';
import 'package:ayadati/features/profile/domain/repo/profile_repositotry.dart';
import 'package:dartz/dartz.dart';

class GetUserProfileUseCase {
  GetUserProfileUseCase({required this.profileRepositotry});
  final ProfileRepositotry profileRepositotry;

  Future<Either<Failure, UserEntity>> call(String userId) async {
   return await profileRepositotry.getUserProfile(userId);
  }
}
