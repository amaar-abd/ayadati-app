import 'package:ayadati/features/doctor_booking/presentation/widgets/doctoe_details_view_body.dart';
import 'package:ayadati/features/home/domain/entites/doctor_entity.dart';
import 'package:flutter/material.dart';

class DoctorDetailsView extends StatelessWidget {
  const DoctorDetailsView({super.key, required this.doctor});
  final DoctorEntity doctor;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: DoctoeDetailsViewBody(doctor: doctor)),
    );
  }
}
