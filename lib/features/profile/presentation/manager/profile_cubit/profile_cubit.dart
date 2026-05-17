import 'package:ayadati/core/common/domain/entites/user_entity.dart';
import 'package:ayadati/features/profile/domain/use_cases/get_user_profile_use_case.dart';
import 'package:ayadati/features/profile/domain/use_cases/update_user_profile_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.getUserProfileUseCase, this.updateUserProfileUseCase)
    : super(ProfileInitial());

  final GetUserProfileUseCase getUserProfileUseCase;
  final UpdateUserProfileUseCase updateUserProfileUseCase;

  Future<void> getUserData(String userId) async {
    emit(ProfileLoading());
    final result = await getUserProfileUseCase(userId);

    result.fold(
      (failure) => emit(ProfileError(message: failure.message)),
      (user) => emit(ProfileLoaded(user: user)),
    );
  }

  Future<void> updateData(UserEntity userData) async {
    emit(ProfileUpdateLoading());
    final result = await updateUserProfileUseCase(userData);
    result.fold(
      (failure) => emit(ProfileUpdateError(message: failure.message)),
      (success) =>
          emit(ProfileUpdateSuccess(message: 'تم تحديث بيانات الملف الشخصي')),
    );
  }
}
