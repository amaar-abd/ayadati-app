import 'package:ayadati/features/appointments/domain/use_cases/get_appointment_user_use_cases.dart';
import 'package:ayadati/features/user_booking/domain/entites/appointment_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'appointments_state.dart';

class AppointmentsCubit extends Cubit<AppointmentsState> {
  AppointmentsCubit(this.getAppointmentUserUseCases)
    : super(AppointmentsInitial());
  final GetAppointmentUserUseCases getAppointmentUserUseCases;

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
}
