import 'package:ayadati/core/theme/app_colors.dart';
import 'package:ayadati/features/appointments/presentation/manager/appointmets_cubit/appointments_cubit.dart';
import 'package:ayadati/features/appointments/presentation/widgets/build_doctor_Image.dart';
import 'package:ayadati/features/appointments/presentation/widgets/build_info_row.dart';
import 'package:ayadati/features/appointments/presentation/widgets/build_status_badge.dart';
import 'package:ayadati/features/appointments/presentation/widgets/show_cancel_dialog.dart';
import 'package:ayadati/features/user_booking/domain/entites/appointment_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class AppointmentCard extends StatelessWidget {
  const AppointmentCard({super.key, required this.appointment});
  final AppointmentEntity appointment;
  @override
  Widget build(BuildContext context) {
    final theme = TextTheme.of(context);
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(60),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BuildDoctorImage(imageUrl: appointment.image),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        ' ${appointment.doctorName}',
                        style: theme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        appointment.specialty,
                        style: theme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppColors.accentGold,
                        ),
                      ),
                      const SizedBox(height: 6),
                      BuildInfoRow(
                        icon: Icons.location_on_outlined,
                        text: '${appointment.city}، ${appointment.address}',
                      ),
                    ],
                  ),
                ),
                BuildStatusBadge(status: appointment.status),
              ],
            ),
          ),

          const Divider(
            height: 1,
            color: AppColors.divider,
            indent: 12,
            endIndent: 12,
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BuildInfoRow(
                  isBold: true,
                  icon: Icons.access_time_rounded,
                  text: DateFormat(
                    'EEEE, d MMMM - hh:mm a',
                    'ar',
                  ).format(appointment.appointmentDate),
                ),
                Text(
                      '${NumberFormat('#,###').format(appointment.fees)} ل.س ',
                      style: theme.bodyLarge?.copyWith(
                        color: AppColors.primaryBlue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
              ],
            ),
          ),
          if (appointment.status == 'قيد الانتظار')
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.red,
                  side: const BorderSide(color: Colors.red, width: 1.2),
                  minimumSize: const Size(double.infinity, 44),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: ()async {
                  showCancelDialog(context,() {
                    if (!context.mounted) return;
                    context.read<AppointmentsCubit>().cancelAppointment(
                 appointment.bookingId,
                  );
                  Navigator.pop(context);
                  },);
                },
                child: Text(
                  'إلغاء الموعد',
                  style: theme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
