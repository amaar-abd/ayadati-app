import 'package:ayadati/core/common/domain/entites/user_entity.dart';
import 'package:ayadati/features/auth/domain/repos/auth_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this.authRepo) : super(SignupInitial());
  final AuthRepo authRepo;
  Future<void> signUp({
    required String name,
    required String phone,
    required String email,
    required String password,
  }) async {
    emit(SignupLoading());
    final result = await authRepo.createUserWithEmailAndPassword(
      name: name,
      phone: phone,
      email: email,
      password: password,
    );

    result.fold(
      (failure) => emit(SignupFailure(message: failure.message)),
      (user) => emit(SignupSuccess(user: user)),
    );
  }
}
