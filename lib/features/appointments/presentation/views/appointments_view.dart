import 'package:ayadati/core/depandency_injection/service_locator.dart';
import 'package:ayadati/core/helper/custom_snackbar.dart';
import 'package:ayadati/core/theme/app_colors.dart';
import 'package:ayadati/features/appointments/domain/use_cases/cancel_appointment_use_case.dart';
import 'package:ayadati/features/appointments/domain/use_cases/get_appointment_user_use_cases.dart';
import 'package:ayadati/features/appointments/presentation/manager/appointmets_cubit/appointments_cubit.dart';
import 'package:ayadati/features/appointments/presentation/widgets/appointments_view_body.dart';
import 'package:ayadati/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppointmentsView extends StatelessWidget {
  const AppointmentsView({super.key});

  @override
  Widget build(BuildContext context) {
    final  authState = context.read<AuthCubit>().state;
    String userId = '';

    if (authState is Authenticated) {
      userId = authState.user.uid;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'المواعيد المحجوزة',
          style: TextTheme.of(context).displaySmall?.copyWith(
            color: AppColors.primaryBlue,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: BlocProvider(
        create: (context) => AppointmentsCubit(
          sl.get<GetAppointmentUserUseCases>(),
          sl.get<CancelAppointmentUseCase>(),
        )..fetchUserAppointments(userId),
        child: BlocConsumer<AppointmentsCubit, AppointmentsState>(
          listener: (context, state) {
            if (state is CancelBookingSuccess) {
              customSnackBar(
                context,
                'تم إلغاء الموعد بنجاح',
                AppColors.success,
              );
            }

            if (state is CancelBookingFailure) {
             customSnackBar(
                context,
                state.message,
                AppColors.error,
              );
            }
          },
          builder: (context, state) {
            return const AppointmentsViewBody();
          },
        ),
      ),
    );
  }
}
