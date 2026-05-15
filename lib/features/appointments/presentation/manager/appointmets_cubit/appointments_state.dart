part of 'appointments_cubit.dart';

class AppointmentsState {}

final class AppointmentsInitial extends AppointmentsState {}

final class AppointmentsLoading extends AppointmentsState {}

final class AppointmentsSuccess extends AppointmentsState {
  final List<AppointmentEntity> appointments;

  AppointmentsSuccess({required this.appointments});
}

final class AppointmentsFailure extends AppointmentsState {
  final String message;

  AppointmentsFailure({required this.message});
}

final class CancelBookingLoading extends AppointmentsState {}

final class CancelBookingSuccess extends AppointmentsState {}

final class CancelBookingFailure extends AppointmentsState {
  final String message;

  CancelBookingFailure({required this.message});
}
