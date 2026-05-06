import 'package:ayadati/features/auth/domain/entites/user_entity.dart';
import 'package:ayadati/features/auth/domain/repos/auth_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'social_auth_state.dart';

class SocialauthCubit extends Cubit<SocialAuthState> {
  SocialauthCubit(this.authRepo) : super(SocialauthInitial());

  final AuthRepo authRepo;

  Future<void> signInWithGoogle() async {
    emit(SocialAuthLoading());
    final results = await authRepo.signInWithGoogle();
    results.fold(
      (failure) => emit(SocialAuthFailure(failure.message)),
      (user) => emit(SocialAuthSuccess(user)),
    );
  }
  Future<void> signInWithFacebook() async {
    emit(SocialAuthLoading());
    final results = await authRepo.signInWithFacebook();
    results.fold(
      (failure) => emit(SocialAuthFailure(failure.message)),
      (user) => emit(SocialAuthSuccess(user)),
    );
  }



}
