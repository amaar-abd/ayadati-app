import 'package:ayadati/core/helper/custom_snackbar.dart';
import 'package:ayadati/core/routes/app_routes.dart';
import 'package:ayadati/core/theme/app_colors.dart';
import 'package:ayadati/features/auth/presentation/manager/signout_cubit/signout_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void showSignOutDialog(BuildContext context,SignoutCubit signoutCubit) {
  showDialog(
    
    context: context,
    builder: (context) => BlocProvider.value(
      value: signoutCubit,
      child: AlertDialog(
        backgroundColor: AppColors.surface,
        
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        titlePadding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
        contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        actionsPadding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
      
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              ' تسجيل الخروج',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.primaryBlue,
                fontSize: 18,
              ),
            ),
            const SizedBox(width: 8),
            const Icon(Icons.logout_outlined, color: AppColors.error, size: 22),
          ],
        ),
      
        content: Padding(
          padding: const EdgeInsets.all(15),
          child: Text(
            'هل تريد تسجيل الخروج من حسابك ؟',
            textAlign: TextAlign.right,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: AppColors.textSecondary,
              height: 1.6,
            ),
          ),
        ),
      
        actions: [
          Row(
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text(
                    'إلغاء',
                    style: TextStyle(
                      color: AppColors.textSecondary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                flex: 1,
                child: BlocConsumer<SignoutCubit, SignoutState>(
                  listener: (context, state) {
                    if (state is SignOutSuccess) {
                      Navigator.pop(context);
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
                    return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.error,
                        foregroundColor: AppColors.textOnPrimary,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 10),
                      ),
                      onPressed: state is SignOutLoading 
                          ? null 
                          : () => context.read<SignoutCubit>().signOut(),
                      child: state is SignOutLoading
                          ? const SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 2,
                              ),
                            )
                          : const Text(
                              'تسجيل الخروج ',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                    
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
