part of 'profile_cubit.dart';

 class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class ProfileLoading extends ProfileState {}

final class ProfileLoaded extends ProfileState {
  final UserEntity user;
  ProfileLoaded({required this.user});
}

final class ProfileError extends ProfileState {
  final String message;
  ProfileError({required this.message});
}

// final class ProfileUpdateLoading extends ProfileState {}

// final class ProfileUpdateSuccess extends ProfileState {
//   final String message;
//   ProfileUpdateSuccess({required this.message});
// }

// final class ProfileUpdateError extends ProfileState {
//   final String message;
//   ProfileUpdateError({required this.message});
// }