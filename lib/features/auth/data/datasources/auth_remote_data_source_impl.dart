import 'package:ayadati/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  const AuthRemoteDataSourceImpl({required this.firebaseAuth});
  final FirebaseAuth firebaseAuth;

  @override
  Stream<User?> authStateChanges() {
   return firebaseAuth.authStateChanges();
  }
}
