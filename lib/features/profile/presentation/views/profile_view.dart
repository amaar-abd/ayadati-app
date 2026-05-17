import 'dart:ui';
import 'package:ayadati/core/depandency_injection/service_locator.dart';
import 'package:ayadati/core/helper/custom_snackbar.dart';
import 'package:ayadati/core/routes/app_routes.dart';
import 'package:ayadati/core/theme/app_colors.dart';
import 'package:ayadati/features/auth/domain/repos/auth_repo.dart';
import 'package:ayadati/features/auth/presentation/manager/signout_cubit/signout_cubit.dart';
import 'package:ayadati/features/profile/presentation/manager/profile_cubit/profile_cubit.dart';
import 'package:ayadati/features/profile/presentation/widgets/build_menu_item.dart';
import 'package:ayadati/features/profile/presentation/widgets/profile_view_body.dart';
import 'package:ayadati/features/profile/presentation/widgets/show_signout_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignoutCubit(sl.get<AuthRepo>()),
      child: Builder(
        builder: (builderContext) {
          return BlocConsumer<SignoutCubit, SignoutState>(
            listener: (context, state) {
              if (state is SignOutSuccess) {
                Navigator.of(context, rootNavigator: true).pop();
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  AppRoutes.loginView,
                  (route) => false,
                );
              } else if (state is SignOutFailure) {
                customSnackBar(context, state.message, AppColors.error);
              }
            },
            builder: (context, state) {
              return Scaffold(
                extendBodyBehindAppBar: true,
                appBar: AppBar(
                  automaticallyImplyLeading: false,
                  elevation: 0,
                  shape: Border(
                    bottom: BorderSide(color: Colors.transparent, width: 0),
                  ),
                  backgroundColor: Colors.transparent,
                  title: Text(
                    'الملف الشخصي',
                    style: TextTheme.of(builderContext).displaySmall?.copyWith(
                      color: AppColors.background,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  actions: [
                    IconButton(
                      icon: const Icon(
                        Icons.more_vert_rounded,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        final signoutCubit = builderContext
                            .read<SignoutCubit>();

                        showGeneralDialog(
                          context: builderContext,
                          barrierDismissible: true,
                          barrierLabel: '',
                          barrierColor: Colors.black.withAlpha(40),
                          transitionDuration: const Duration(milliseconds: 150),
                          pageBuilder: (context, anim1, anim2) =>
                              const SizedBox.shrink(),
                          transitionBuilder:
                              (
                                dialogContext,
                                animation,
                                secondaryAnimation,
                                child,
                              ) {
                                return FadeTransition(
                                  opacity: animation,
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(
                                      sigmaX: 5,
                                      sigmaY: 5,
                                    ),
                                    child: Stack(
                                      children: [
                                        GestureDetector(
                                          onTap: () =>
                                              Navigator.pop(dialogContext),
                                          child: Container(
                                            color: Colors.transparent,
                                          ),
                                        ),

                                        Positioned(
                                          top:
                                              kToolbarHeight +
                                              MediaQuery.of(
                                                dialogContext,
                                              ).padding.top -
                                              10,
                                          left: 16,
                                          child: Material(
                                            color: Colors.transparent,
                                            child: Container(
                                              width: 220,
                                              decoration: BoxDecoration(
                                                color: AppColors.surface
                                                    .withAlpha(240),
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.black
                                                        .withAlpha(20),
                                                    blurRadius: 10,
                                                  ),
                                                ],
                                              ),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  BuildMenuItem(
                                                    context: dialogContext,
                                                    icon: Icons.edit_outlined,
                                                    title: 'تعديل الملف الشخصي',
                                                    onTap: () {
                                                      Navigator.pop(
                                                        dialogContext,
                                                      );
                                                      final profileState =
                                                          builderContext
                                                              .read<
                                                                ProfileCubit
                                                              >()
                                                              .state;
                                                      if (profileState
                                                          is ProfileLoaded) {
                                                        Navigator.of(
                                                          context,
                                                        ).pushNamed(
                                                          AppRoutes
                                                              .profileEditView,
                                                          arguments: {
                                                            'user': profileState
                                                                .user,
                                                            'cubit':
                                                                builderContext
                                                                    .read<
                                                                      ProfileCubit
                                                                    >(),
                                                          },
                                                        );
                                                      }
                                                    },
                                                  ),
                                                  BuildMenuItem(
                                                    context: dialogContext,
                                                    icon: Icons
                                                        .info_outline_rounded,
                                                    title: 'من نحن',
                                                    onTap: () {
                                                      Navigator.pop(
                                                        dialogContext,
                                                      );
                                                      // كود من نحن هنا
                                                    },
                                                  ),
                                                  BuildMenuItem(
                                                    context: dialogContext,
                                                    icon: Icons.help,
                                                    title: 'المساعدة',
                                                    onTap: () {
                                                      Navigator.pop(
                                                        dialogContext,
                                                      );
                                                    },
                                                  ),
                                                  const Divider(
                                                    height: 1,
                                                    indent: 16,
                                                    endIndent: 16,
                                                  ),
                                                  BuildMenuItem(
                                                    color: AppColors.error,
                                                    context: dialogContext,
                                                    icon: Icons.logout_rounded,
                                                    fontWeight: FontWeight.bold,
                                                    title: 'تسجيل الخروج',
                                                    onTap: () {
                                                      Navigator.pop(
                                                        dialogContext,
                                                      );
                                                      showSignOutDialog(
                                                        builderContext,
                                                        signoutCubit,
                                                      );
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                        );
                      },
                    ),
                  ],
                ),

                body: const ProfileViewBody(),
              );
            },
          );
        },
      ),
    );
  }
}
