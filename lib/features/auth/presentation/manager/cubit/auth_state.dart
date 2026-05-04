part of 'auth_cubit.dart';

class AuthState {}

final class AuthInitial extends AuthState {}

final class Authenticated extends AuthState {
  Authenticated({required this.user});
  final User user;
}

final class UnAuthenticated extends AuthState {}
