import 'package:ayadati/features/auth/domain/entites/user_entity.dart';
import 'package:ayadati/features/auth/domain/repos/auth_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'signin_state.dart';

class SigninCubit extends Cubit<SigninState> {
  SigninCubit(this.authRepo) : super(SigninInitial());

  final AuthRepo authRepo;

  Future<void> login({required String email, required String password}) async {
    emit(SigninLoading());
    final results = await authRepo.loginWithEmailAndPassword(
      email: email,
      password: password,
    );
    results.fold(
      (failure) => emit(SigninFailure(message: failure.message)),
      (user) => emit(SigninSuccess(user: user)),
    );
  }
}
