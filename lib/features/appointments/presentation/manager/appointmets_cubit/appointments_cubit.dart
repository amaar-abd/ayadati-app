import 'package:ayadati/features/appointments/domain/use_cases/cancel_appointment_use_case.dart';
import 'package:ayadati/features/appointments/domain/use_cases/get_appointment_user_use_cases.dart';
import 'package:ayadati/features/user_booking/domain/entites/appointment_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'appointments_state.dart';

class AppointmentsCubit extends Cubit<AppointmentsState> {
  AppointmentsCubit(
    this.getAppointmentUserUseCases,
    this.cancelAppointmentUseCase,
  ) : super(AppointmentsInitial());

  final GetAppointmentUserUseCases getAppointmentUserUseCases;
  final CancelAppointmentUseCase cancelAppointmentUseCase;

  Future<void> fetchUserAppointments(String userId) async {
    emit(AppointmentsLoading());
    final result = await getAppointmentUserUseCases.call(userId);

    result.fold(
      (failure) {
        emit(AppointmentsFailure(message: failure.message));
      },
      (appointments) {
        emit(AppointmentsSuccess(appointments: appointments));
      },
    );
  }

  Future<void> cancelAppointment(String bookingId) async {
    final currentState = state;
    emit(CancelBookingLoading());

    final result = await cancelAppointmentUseCase.call(bookingId: bookingId);

    result.fold(
      (failure) => emit(CancelBookingFailure(message: failure.message)),
      (_) {
        if (currentState is AppointmentsSuccess) {
          final updatedList = currentState.appointments
              .where((appointment) => appointment.bookingId != bookingId)
              .toList();
        emit(CancelBookingSuccess());
        emit(AppointmentsSuccess(appointments: updatedList));
        }else {
        emit(CancelBookingSuccess());
        }
      },
    );
  }
}
