import 'package:ayadati/features/home/domain/entites/doctor_entity.dart';
import 'package:ayadati/features/user_booking/presentation/widgets/booking_view_body.dart';
import 'package:flutter/material.dart';

class BookingView extends StatelessWidget {
  const BookingView({super.key, required this.doctor});
  final DoctorEntity doctor;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: BookingViewBody(doctor: doctor)),
    );
  }
}
