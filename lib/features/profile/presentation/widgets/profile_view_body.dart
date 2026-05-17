import 'package:ayadati/core/theme/app_colors.dart';
import 'package:ayadati/features/profile/presentation/manager/profile_cubit/profile_cubit.dart';
import 'package:ayadati/features/profile/presentation/widgets/camera_container.dart';
import 'package:ayadati/features/profile/presentation/widgets/custom_image_profile.dart';
import 'package:ayadati/features/profile/presentation/widgets/profile_info_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = TextTheme.of(context);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if (state is ProfileLoading) {
          return const Center(
            child: CircularProgressIndicator(
              color: AppColors.primaryBlue,
              strokeWidth: 2,
            ),
          );
        }
        if (state is ProfileError) {
          return Center(
            child: Text(
              'حدث خطأ: ${state.message}',
              style: theme.bodyLarge?.copyWith(color: AppColors.error),
            ),
          );
        }
        if (state is ProfileLoaded) {
          final user = state.user;
          return SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: height * 0.45,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: AppColors.primaryBlue,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(25),
                            bottomRight: Radius.circular(25),
                          ),
                        ),
                        width: double.infinity,
                        height: height * 0.25,
                      ),
                      Positioned(
                        top: height * 0.20,
                        right: 20,
                        left: 20,
                        child: Container(
                          width: width - 50,
                          height: height * 0.23,
                          decoration: BoxDecoration(
                            color: AppColors.accentGold,
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                      ),
                      Positioned(
                        top: height * 0.30,
                        right: 20,
                        left: 20,
                        child: Container(
                          width: width - 50,
                          height: height * 0.13,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withAlpha(50),
                                blurRadius: 4,
                                offset: Offset(0, 5),
                              ),
                            ],
                            color: AppColors.background,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(height: 10),
                              Text(
                                user.name.isEmpty ? 'بدون اسم' : user.name,
                                style: theme.displayMedium?.copyWith(
                                  color: AppColors.primaryBlue,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                user.email,
                                style: theme.bodyLarge?.copyWith(
                                  color: AppColors.textSecondary,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      //profile image >>
                      Positioned(
                        top: height * 0.12,
                        left: 0,
                        right: 0,
                        child: CustomImageProfile(height: height, width: width),
                      ),
                      Positioned(
                        top: height * 0.27,
                        right: width * 0.35,
            
                        child: CameraContainer(),
                      ),
                    ],
                  ),
                ),
                if(user.phone !=null)
                ProfileInfoCard(
                  title: 'رقم الهاتف',
                  subTitle: user.phone! ,
                  widget: Icon(Icons.phone),
                ),
                if (user.address != null)
                  ProfileInfoCard(
                    title: 'مكان السكن',
                    subTitle: user.address!,
                    widget: const Icon(Icons.person_pin),
                  ),
            
                if (user.gender != null && user.gender!.isNotEmpty)
                  ProfileInfoCard(
                    title: 'الجنس',
                    subTitle: user.gender!,
                    widget: const Icon(Icons.people_outline_rounded),
                  ),
                if (user.age != null)
                  ProfileInfoCard(
                    title: 'العمر',
                    subTitle: '${user.age} سنة',
                    widget: const Icon(Icons.accessibility_outlined),
                  ),
              ],
            ),
          );
        }
        return Center(
          child: Text(
            'جاري تحميل بيانات الملف الشخصي...',
            style: theme.bodyLarge?.copyWith(color: AppColors.primaryBlue),
          ),
        );
      },
    );
  }
}
