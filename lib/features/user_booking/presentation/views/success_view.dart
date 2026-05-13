import 'package:ayadati/features/user_booking/domain/entites/success_entity.dart';
import 'package:ayadati/features/user_booking/presentation/widgets/success_view_body.dart';
import 'package:flutter/material.dart';

class SuccessView extends StatelessWidget {
  const SuccessView({super.key, required this.successEntity});
  final SuccessEntity successEntity;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: SuccessViewBody(successEntity: successEntity)),
    );
  }
}
