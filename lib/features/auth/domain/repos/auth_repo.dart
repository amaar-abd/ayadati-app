import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepo {
  Stream<User?> onAuthStateChanged();
}
