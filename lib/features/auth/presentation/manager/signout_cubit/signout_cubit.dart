import 'package:ayadati/features/auth/domain/repos/auth_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'signout_state.dart';

class SignoutCubit extends Cubit<SignoutState> {
  SignoutCubit(this.authRepo) : super(SignoutInitial());
  final AuthRepo authRepo;


  Future<void> signOut() async {
    emit(SignOutLoading());
    try {
      await authRepo.signOut();
      emit(SignOutSuccess());
    } catch (e) {
      emit(SignOutFailure(e.toString()));
    }
  }
}

