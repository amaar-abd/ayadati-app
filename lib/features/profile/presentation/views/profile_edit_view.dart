import 'package:ayadati/core/theme/app_colors.dart';
import 'package:ayadati/core/common/domain/entites/user_entity.dart';
import 'package:ayadati/features/profile/presentation/widgets/profile_edit_view_body.dart';
import 'package:flutter/material.dart';

class ProfileEditView extends StatelessWidget {
  const ProfileEditView({super.key, required this.user});
  final UserEntity user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'تعديل الملف الشخصي',
          style: TextTheme.of(context).displaySmall?.copyWith(
            color: AppColors.background,
            fontWeight: FontWeight.bold,
          ),
        ),

        backgroundColor: AppColors.primaryBlue,
        iconTheme: IconThemeData(color: AppColors.background),
      ),
      body: ProfileEditViewBody(user: user),
    );
  }
}
