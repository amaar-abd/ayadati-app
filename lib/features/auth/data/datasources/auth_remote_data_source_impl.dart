import 'package:ayadati/core/constants/backend_constants.dart';
import 'package:ayadati/core/errors/custom_exception.dart';
import 'package:ayadati/core/errors/firebase_auth_error_handler.dart';
import 'package:ayadati/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:ayadati/features/auth/data/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  const AuthRemoteDataSourceImpl({
    required this.firestore,
    required this.firebaseAuth,
    required this.googleSignIn,
    required this.facebookSignIn,
  });
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firestore;
  final GoogleSignIn googleSignIn;
  final FacebookAuth facebookSignIn;

  @override
  Stream<User?> authStateChanges() {
    return firebaseAuth.authStateChanges();
  }

  @override
  Future<UserModel> createUserWithEmailAndPassword({
    required String name,
    required String phone,
    required String email,
    required String password,
  }) async {
    try {
      final response = await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = response.user;
      if (user != null) {
        final usermodel = UserModel(
          uid: user.uid,
          name: name,
          email: email,
          phone: phone,
        );
        await firestore
            .collection(BackendConstants.users)
            .doc(user.uid)
            .set(usermodel.toMap());
        return usermodel;
      } else {
        throw Exception();
      }
    } catch (e) {
      throw ServerException(message: AuthErrorHandler.handle(e));
    }
  }

  @override
  Future<UserModel> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final response = await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final doc = await firestore
          .collection(BackendConstants.users)
          .doc(response.user!.uid)
          .get();

      if (doc.exists && doc.data() != null) {
        return UserModel.fromMap(doc.data() as Map<String, dynamic>);
      } else {
        throw ServerException(message: "User data not found in database");
      }
    } catch (e) {
      throw ServerException(message: AuthErrorHandler.handle(e));
    }
  }

  @override
  Future<User?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      if (googleUser == null) return null;

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final userCredential = await firebaseAuth.signInWithCredential(
        credential,
      );
      final user = userCredential.user;
      if (user != null) {
        final userModel = UserModel(
          uid: user.uid,
          name: user.displayName ?? 'No Name',
          email: user.email ?? 'No Email',
          photoUrl: user.photoURL ?? '',
          phone: user.phoneNumber ?? 'no phone number',
        );
        await firestore
            .collection(BackendConstants.users)
            .doc(user.uid)
            .set(userModel.toMap(), SetOptions(merge: true));
        return user;
      }
      return null;
    } catch (e) {
     throw ServerException(message: AuthErrorHandler.handle(e));
    }
  }

  @override
  Future<User?> signInWithFacebook() async {
    try {
      final LoginResult result = await facebookSignIn.login();
      if (result.status == LoginStatus.success) {
        final OAuthCredential credential = FacebookAuthProvider.credential(
          result.accessToken!.tokenString,
        );
        final userCredential = await firebaseAuth.signInWithCredential(
          credential,
        );
        final user = userCredential.user;

        if (user != null) {
          final userModel = UserModel(
            uid: user.uid,
            name: user.displayName ?? 'No Name',
            email: user.email ?? 'No Email',
            photoUrl: user.photoURL ?? '',
            phone: user.phoneNumber ?? 'no phone number',
          );
          await firestore
              .collection(BackendConstants.users)
              .doc(user.uid)
              .set(userModel.toMap(), SetOptions(merge: true));
          return user;
        }
      }
      return null;
    } catch (e) {
     throw ServerException(message: AuthErrorHandler.handle(e));
    }
  }
}
