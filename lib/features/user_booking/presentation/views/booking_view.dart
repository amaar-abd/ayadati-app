import 'package:ayadati/core/depandency_injection/service_locator.dart';
import 'package:ayadati/features/home/domain/entites/doctor_entity.dart';
import 'package:ayadati/features/user_booking/domain/use_cases/add_appointment_use_case.dart';
import 'package:ayadati/features/user_booking/presentation/manager/booking_cubit/booking_cubit.dart';
import 'package:ayadati/features/user_booking/presentation/widgets/booking_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookingView extends StatelessWidget {
  const BookingView({super.key, required this.doctor});
  final DoctorEntity doctor;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) => BookingCubit(sl.get<AddAppointmentUseCase>()),
          child: BookingViewBody(doctor: doctor),
        ),
      ),
    );
  }
}
