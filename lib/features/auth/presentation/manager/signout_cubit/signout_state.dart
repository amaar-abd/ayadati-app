part of 'signout_cubit.dart';

 class SignoutState {}

final class SignoutInitial extends SignoutState {}
class SignOutLoading extends SignoutState {}
class SignOutSuccess extends SignoutState {}
class SignOutFailure extends SignoutState {
  final String message;
  SignOutFailure(this.message);
}