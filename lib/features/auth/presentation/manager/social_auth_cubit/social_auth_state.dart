part of 'social_auth_cubit.dart';

class SocialAuthState {}

final class SocialauthInitial extends SocialAuthState {}

class SocialAuthLoading extends SocialAuthState {}

class SocialAuthSuccess extends SocialAuthState {
  final UserEntity? user;
  SocialAuthSuccess(this.user);
}

class SocialAuthFailure extends SocialAuthState {
  final String message;
  SocialAuthFailure(this.message);
}
