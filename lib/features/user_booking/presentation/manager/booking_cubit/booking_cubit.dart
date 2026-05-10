import 'package:ayadati/features/user_booking/domain/entites/appointment_entity.dart';
import 'package:ayadati/features/user_booking/domain/use_cases/add_appointment_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'booking_state.dart';

class BookingCubit extends Cubit<BookingState> {
  BookingCubit(this.addAppointmentUseCase) : super(BookingInitial());

  final AddAppointmentUseCase addAppointmentUseCase;

  Future<void> addAppointmen(AppointmentEntity appointment) async {
    emit(BookingLoading());
    final result = await addAppointmentUseCase(appointment);

    result.fold(
      (failure) => emit(BookingFailure(message: failure.message)),
      (success) => emit(BookingSuccess()),
    );
  }
}
