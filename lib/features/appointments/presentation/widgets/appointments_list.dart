import 'package:ayadati/core/theme/app_colors.dart';
import 'package:ayadati/features/appointments/presentation/manager/appointmets_cubit/appointments_cubit.dart';
import 'package:ayadati/features/appointments/presentation/widgets/appointment_card.dart';
import 'package:ayadati/features/appointments/presentation/widgets/empty_appointments_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppointmentsList extends StatelessWidget {
  const AppointmentsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppointmentsCubit, AppointmentsState>(
      builder: (context, state) {
        
        if (state is AppointmentsSuccess) {
          if (state.appointments.isNotEmpty) {
        return ListView.builder(
          shrinkWrap: true,
          itemCount: state.appointments.length,
          itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: AppointmentCard(appointment:state.appointments[index] ),
          );
        }
        ,) ;
          
        }else{
          return EmptyAppointmentsView();
        } 
        }else if(state is AppointmentsLoading){
          return Center(child: CircularProgressIndicator(color: AppColors.primaryBlue,),);
        }else if(state is AppointmentsFailure){
          return Center(child: Text(state.message,style: TextTheme.of(context).bodyLarge?.copyWith(color: AppColors.error,fontWeight: FontWeight.bold),));
        }else {
          return EmptyAppointmentsView();
        }
      },
    );
  }
}