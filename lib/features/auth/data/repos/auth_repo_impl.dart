import 'package:ayadati/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:ayadati/features/auth/domain/repos/auth_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepoImpl implements AuthRepo {
  AuthRepoImpl({required this.authRemoteDataSource});
  final AuthRemoteDataSource authRemoteDataSource;

  @override
  Stream<User?> onAuthStateChanged() {
    return authRemoteDataSource.authStateChanges();
  }
}
