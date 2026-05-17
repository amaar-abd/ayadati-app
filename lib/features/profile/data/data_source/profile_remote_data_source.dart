import 'package:ayadati/core/common/data/models/user_model.dart';

abstract class ProfileRemoteDataSource {
  Future<UserModel> getUserProfile(String userId,String path);
  Future<void> updateUserProfile(UserModel userModel, String path);
}
