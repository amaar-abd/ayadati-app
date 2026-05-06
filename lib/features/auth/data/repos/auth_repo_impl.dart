import 'package:ayadati/core/errors/failures.dart';
import 'package:ayadati/core/errors/firebase_auth_error_handler.dart';
import 'package:ayadati/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:ayadati/features/auth/domain/entites/user_entity.dart';
import 'package:ayadati/features/auth/domain/repos/auth_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepoImpl implements AuthRepo {
  AuthRepoImpl({required this.authRemoteDataSource});
  final AuthRemoteDataSource authRemoteDataSource;

  @override
  Stream<User?> onAuthStateChanged() {
    return authRemoteDataSource.authStateChanges();
  }

  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword({
    required String name,
    required String phone,
    required String email,
    required String password,
  }) async {
    try {
      final user = await authRemoteDataSource.createUserWithEmailAndPassword(
        name: name,
        phone: phone,
        email: email,
        password: password,
      );
      return right(
        UserEntity(uid: user.uid, name: name, email: email, phone: phone),
      );
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final user = await authRemoteDataSource.loginWithEmailAndPassword(
        email: email,
        password: password,
      );
      return right(
        UserEntity(
          uid: user.uid,
          name: user.name,
          email: user.email,
          phone: user.phone,
        ),
      );
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity?>> signInWithGoogle() async {
    try {
      final user = await authRemoteDataSource.signInWithGoogle();
      if (user == null) {
        return right(null);
      } else {
        return right(
          UserEntity(
            uid: user.uid,
            name: user.displayName?? 'no name',
            email: user.email??'no email',
            phone: user.phoneNumber?? 'no phone number',photoUrl: user.photoURL??'no photo'
          ),
        );
      }
      } catch (e) {
      return left(ServerFailure(message: AuthErrorHandler.handle(e)));
    }
  }
}
