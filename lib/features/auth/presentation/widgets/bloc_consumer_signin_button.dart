import 'package:ayadati/core/helper/custom_snackbar.dart';
import 'package:ayadati/core/routes/app_routes.dart';
import 'package:ayadati/core/theme/app_colors.dart';
import 'package:ayadati/features/auth/presentation/manager/signin_cubit/signin_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocConsumerSignInButton extends StatelessWidget {
  const BlocConsumerSignInButton({
    super.key,
    required GlobalKey<FormState> globalKey,
    required this.emailController,
    required this.passwordController,
    required this.voidCallback,
  }) : _globalKey = globalKey;

  final GlobalKey<FormState> _globalKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final VoidCallback voidCallback;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: BlocConsumer<SigninCubit, SigninState>(
        listener: (context, state) {
          if (state is SigninSuccess) {
            customSnackBar(context, 'تم تسجيل الدخول', AppColors.success);
            Navigator.of(context).pushNamed(AppRoutes.mainView);
          } else if (state is SigninFailure) {
            customSnackBar(context, state.message, AppColors.error);
          }
        },
        builder: (context, state) {
          final isLoading = state is SigninLoading;
          return SizedBox(
            width: double.infinity,
            height: 55,
            child: ElevatedButton(
              onPressed: () {
                if (_globalKey.currentState!.validate()) {
                  context.read<SigninCubit>().login(
                    email: emailController.text,
                    password: passwordController.text,
                  );
                } else {
                  voidCallback();
                }
              },
              child: isLoading
                  ? const SizedBox(
                      height: 26,
                      width: 26,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 3,
                      ),
                    )
                  : const Text('تسجيل الدخول'),
            ),
          );
        },
      ),
    );
  }
}
