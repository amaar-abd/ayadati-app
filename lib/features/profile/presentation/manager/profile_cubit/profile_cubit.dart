import 'package:ayadati/features/auth/domain/entites/user_entity.dart';
import 'package:ayadati/features/profile/domain/use_cases/get_user_profile_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.getUserProfileUseCase) : super(ProfileInitial());

  final GetUserProfileUseCase getUserProfileUseCase;

  Future<void> getUserData(String userId) async {
    emit(ProfileLoading());
    final result = await getUserProfileUseCase(userId);

    result.fold(
      (failure) => emit(ProfileError(message: failure.message)),
      (user) => emit(ProfileLoaded(user: user)),
    );
  }
}
