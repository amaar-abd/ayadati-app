import 'package:ayadati/features/home/domain/entites/doctor_entity.dart';
import 'package:ayadati/features/user_booking/presentation/widgets/doctor_details_view_body.dart';
import 'package:flutter/material.dart';

class DoctorDetailsView extends StatelessWidget {
  const DoctorDetailsView({super.key, required this.doctor});
  final DoctorEntity doctor;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: DoctorDetailsViewBody(doctor: doctor)),
    );
  }
}
