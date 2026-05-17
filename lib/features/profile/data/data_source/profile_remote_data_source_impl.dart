import 'package:ayadati/core/errors/custom_exception.dart';
import 'package:ayadati/core/common/data/models/user_model.dart';
import 'package:ayadati/features/profile/data/data_source/profile_remote_data_source.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  ProfileRemoteDataSourceImpl({required this.firestore});
  final FirebaseFirestore firestore;

  @override
  Future<UserModel> getUserProfile(String userId, String path) async {
    try {
      DocumentSnapshot doc = await firestore.collection(path).doc(userId).get();
      if (doc.exists && doc.data() != null) {
        return UserModel.fromMap(doc.data() as Map<String, dynamic>);
      } else {
        throw ServerException(message: 'المستخدم غير موجود في قاعدة البانات');
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> updateUserProfile(UserModel userModel, String path) async {
    try {
      await firestore
          .collection(path)
          .doc(userModel.uid)
          .update(userModel.toMap());
    } catch (e) {
      ServerException(message: 'فشل تحديث بيانات الملف الشخصي: $e');
    }
  }
}
