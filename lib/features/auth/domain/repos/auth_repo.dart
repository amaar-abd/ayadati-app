import 'package:ayadati/core/errors/failures.dart';
import 'package:ayadati/features/auth/domain/entites/user_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepo {
  Stream<User?> onAuthStateChanged();

  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword({
    required String name,
    required String phone,
    required String email,
    required String password,
  });

  Future<Either<Failure, UserEntity>> loginWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<Either<Failure, UserEntity?>> signInWithGoogle();
  Future<Either<Failure, UserEntity?>> signInWithFacebook();
 
}
