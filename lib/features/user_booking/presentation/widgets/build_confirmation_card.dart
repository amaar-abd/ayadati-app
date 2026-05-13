import 'package:ayadati/core/helper/custom_snackbar.dart';
import 'package:ayadati/core/routes/app_routes.dart';
import 'package:ayadati/core/theme/app_colors.dart';
import 'package:ayadati/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:ayadati/features/home/domain/entites/doctor_entity.dart';
import 'package:ayadati/features/user_booking/domain/entites/appointment_entity.dart';
import 'package:ayadati/features/user_booking/domain/entites/success_entity.dart';
import 'package:ayadati/features/user_booking/presentation/manager/booking_cubit/booking_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class BuildConfirmationCard extends StatelessWidget {
  const BuildConfirmationCard({
    super.key,
    required this.selectedDate,
    required this.selectedTime,
    required this.doctor,
  });
  final DoctorEntity doctor;
  final DateTime selectedDate;
  final String selectedTime;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF1A237E),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Text(
            "الموعد المحدد\n ${DateFormat('EEEE', 'ar').format(selectedDate)} - ${DateFormat('d', 'en').format(selectedDate)} ${DateFormat('MMMM', 'ar').format(selectedDate)} - ${selectedTime.replaceAll('\n', ' ')} ",
            style: const TextStyle(color: Colors.white, fontSize: 16),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 15),
          BlocConsumer<BookingCubit, BookingState>(
            listener: (context, state) {
              if (state is BookingSuccess) {
                final successEntity = SuccessEntity(
                  doctor: doctor,
                  selectedDate: selectedDate,
                  selectedTime: selectedTime,
                );
                Navigator.pushNamed(
                  context,
                  AppRoutes.successView,
                  arguments: successEntity,
                );
              } else if (state is BookingFailure) {
                customSnackBar(context, state.message, AppColors.error);
              }
            },
            builder: (context, state) {
              return ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF8B6B23),
                  minimumSize: const Size(double.infinity, 50),
                ),

                onPressed: state is BookingLoading
                    ? null
                    : () {
                        final authState = context.read<AuthCubit>().state;
                        String userId = '';
                        if (authState is Authenticated) {
                          userId = authState.user.uid;
                        } else {
                          return;
                        }
                        String timeString = selectedTime.split('\n')[0].trim();
                        String period = selectedTime.split('\n')[1].trim();
                        int hour = int.parse(timeString.split(':')[0].trim());
                        int minute = int.parse(timeString.split(':')[1].trim());
                        if (period == "مساءً" && hour < 12) hour += 12;
                        if (period == "صباحاً" && hour == 12) hour = 0;
                        final finalAppointmentDate = DateTime(
                          selectedDate.year,
                          selectedDate.month,
                          selectedDate.day,
                          hour,
                          minute,
                        );
                        final appointment = AppointmentEntity(
                          userId: userId,
                          doctorId: doctor.doctorId,
                          doctorName: doctor.name,
                          bookingId: '',
                          image: doctor.image,
                          city: doctor.city,
                          address: doctor.address,
                          fees: doctor.fees,
                          specialty: doctor.specialty,
                          status: 'pending',
                          appointmentDate: finalAppointmentDate,
                        );
                        context.read<BookingCubit>().addAppointmen(appointment);
                      },
                child: state is BookingLoading
                    ? const SizedBox(
                        height: 25,
                        width: 25,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 4,
                        ),
                      )
                    : const Text("تأكيد الموعد"),
              );
            },
          ),
        ],
      ),
    );
  }
}
