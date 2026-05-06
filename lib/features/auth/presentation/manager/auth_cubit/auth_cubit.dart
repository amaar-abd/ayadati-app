import 'package:ayadati/core/services/cache_helper.dart';
import 'package:ayadati/features/auth/domain/repos/auth_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._authRepo) : super(AuthInitial()) {
    checkUserAuth();
  }

  final AuthRepo _authRepo;

  void checkUserAuth() async {
    await Future.delayed(const Duration(seconds: 3));

    dynamic rawData = CacheHelper.getData(key: 'onboarding_done');
  
  bool onboardingDone = (rawData == true);

    if (!onboardingDone) {
      emit(UnAuthenticated());
      return;
    }

    _authRepo.onAuthStateChanged().listen((user) {
      if (user != null) {
        emit(Authenticated(user: user));
      } else {
        emit(UnAuthenticated());
      }
    });
  }
}
