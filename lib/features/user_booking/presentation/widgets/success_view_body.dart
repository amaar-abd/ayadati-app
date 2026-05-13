import 'package:ayadati/core/routes/app_routes.dart';
import 'package:ayadati/core/theme/app_colors.dart';
import 'package:ayadati/features/user_booking/domain/entites/success_entity.dart';
import 'package:ayadati/features/user_booking/presentation/widgets/custom_success_info_cart.dart';
import 'package:ayadati/features/user_booking/presentation/widgets/instructions_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

class SuccessViewBody extends StatefulWidget {
  const SuccessViewBody({super.key, required this.successEntity});
  final SuccessEntity successEntity;

  @override
  State<SuccessViewBody> createState() => _SuccessViewBodyState();
}

class _SuccessViewBodyState extends State<SuccessViewBody>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Lottie.asset(
              'assets/animations/Checked.json',
              repeat: false,
              controller: _animationController,
              height: 200,
              width: 200,
              fit: BoxFit.cover,
              onLoaded: (composition) {
                _animationController.duration = composition.duration;
                _animationController.animateTo(48 / 63);
              },
            ),
            Text(
              'تم تأكيد موعدك بنجاح',
              style: TextTheme.of(context).displayLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.primaryBlue,
              ),
            ),
            const SizedBox(height: 12),
            CustomSuccessInfoCart(
              title: widget.successEntity.doctor.name,
              subTitle: widget.successEntity.doctor.specialty,
              descIcon: 'الطبيب المختص',
              icon: FaIcon(
                FontAwesomeIcons.userDoctor,
                color: AppColors.accentGold,
              ),
            ),
            const SizedBox(height: 10),
            CustomSuccessInfoCart(
              title:
                  "${DateFormat('EEEE', 'ar').format(widget.successEntity.selectedDate)} - ${widget.successEntity.selectedDate.toIso8601String().split('T').first}",
              subTitle: widget.successEntity.selectedTime,
              descIcon: 'التاريخ و الوقت',
              icon: FaIcon(
                FontAwesomeIcons.calendarDays,
                color: AppColors.accentGold,
              ),
            ),
            const SizedBox(height: 10),
            CustomSuccessInfoCart(
              title: widget.successEntity.doctor.city,
              subTitle: widget.successEntity.doctor.address,
              descIcon: 'الموقع',
              icon: FaIcon(
                FontAwesomeIcons.locationDot,
                color: AppColors.accentGold,
              ),
            ),
            const SizedBox(height: 10),
            InstructionsCard(),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  AppRoutes.mainView,
                  (route) => false,
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('العودة للرئيسة'),
                  const SizedBox(width: 5),
                  Icon(
                    Icons.home_outlined,
                    color: AppColors.background,
                    size: 25,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
