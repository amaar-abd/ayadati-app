import 'package:ayadati/core/theme/app_colors.dart';
import 'package:ayadati/features/profile/presentation/manager/profile_cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomHomeAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomHomeAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: false,
      automaticallyImplyLeading: false,
      backgroundColor: AppColors.surface,
      elevation: 0,
      toolbarHeight: 70,
      titleSpacing: 16,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.person, color: AppColors.primaryBlue, size: 50),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'مرحبا،',
                style: TextTheme.of(context).bodyLarge?.copyWith(
                  color: AppColors.primaryBlue,
                  fontWeight: FontWeight.bold,
                ),
              ),

              BlocBuilder<ProfileCubit, ProfileState>(
                builder: (context, state) {
                  String name = 'جاري التحميل...'; 
                  if (state is ProfileLoaded) {
                    name = state.user.name; 
                  } else if (state is ProfileError) {
                    name = 'مستخدم عيادتي'; 
                  }
                  return Text(
                    name,
                    maxLines: 1,
                    style: TextTheme.of(context).bodyMedium?.copyWith(
                      overflow: TextOverflow.ellipsis,
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),

      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: AppColors.accentGold.withAlpha(40),
              borderRadius: BorderRadius.circular(30),
            ),
            child: IconButton(
              icon: FaIcon(FontAwesomeIcons.bell, color: AppColors.primaryBlue),
              onPressed: () {
                //notifications logic
              },
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70);
}
