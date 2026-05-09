import 'package:ayadati/core/theme/app_colors.dart';
import 'package:ayadati/features/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:ayadati/features/home/presentation/widgets/doctor_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SpecialtyDoctorsViewBody extends StatelessWidget {
  const SpecialtyDoctorsViewBody({super.key, required this.specialtyName});
  final String specialtyName;
  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state is HomeLoading) return Center(child: CircularProgressIndicator(color: AppColors.primaryBlue,));
            if (state is HomeSuccess) {
               return ListView.builder(
                shrinkWrap: true,
                 itemCount: state.doctors.length,
                 itemBuilder: (context, index) => Padding(
                   padding: const EdgeInsets.all(16),
                   child: RecoomenedDoctorItem(doctor: state.doctors[index]),
                 ),
               );
            }
            if (state is HomeFailure) return Center(child: Text(state.message));
            return SizedBox.shrink();
          },
        
      
    );
  }
}
