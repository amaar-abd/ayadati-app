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
