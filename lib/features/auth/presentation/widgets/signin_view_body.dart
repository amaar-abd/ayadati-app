import 'package:ayadati/core/helper/custom_snackbar.dart';
import 'package:ayadati/core/routes/app_routes.dart';
import 'package:ayadati/core/theme/app_colors.dart';
import 'package:ayadati/core/utils/app_images.dart';
import 'package:ayadati/features/auth/presentation/manager/signin_cubit/signin_cubit.dart';
import 'package:ayadati/features/auth/presentation/widgets/accounts_button.dart';
import 'package:ayadati/features/auth/presentation/widgets/build_header_signin.dart';
import 'package:ayadati/features/auth/presentation/widgets/custom_divider.dart';
import 'package:ayadati/features/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:ayadati/features/auth/presentation/widgets/user_question_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SigninViewBody extends StatefulWidget {
  const SigninViewBody({super.key});

  @override
  State<SigninViewBody> createState() => _SigninViewBodyState();
}

class _SigninViewBodyState extends State<SigninViewBody> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  bool isObscure = true;

  @override
  void dispose() {
    super.dispose();
    passwordController.dispose();
    emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _globalKey,
      autovalidateMode: autovalidateMode,
      child: SingleChildScrollView(
        child: Column(
          children: [
            BuildHeaderSignin(),
            const SizedBox(height: 15),
            Padding(
                       padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withAlpha(40),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 8),
                    Text(
                      'تسجيل الدخول',
                      style: TextTheme.of(context).displayMedium?.copyWith(
                        color: AppColors.primaryBlue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'أدخل بياناتك للوصول إلى ملفك الشخصي',
                      style: TextTheme.of(context).bodyLarge?.copyWith(
                        color: AppColors.textPrimary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 30),
                    CustomTextFormField(
                      title: 'البريد الإلكتروني',
                      hintText: 'example@mail.com',
                      controller: emailController,
                      obscureText: false,
                      suffixIcon: const Icon(
                        Icons.email,
                        color: AppColors.primaryBlue,
                      ),
                    ),
                    const SizedBox(height: 16),
                    CustomTextFormField(
                      title: 'كلمة المرور',
                      hintText: '********',
                      controller: passwordController,
                      obscureText: isObscure,
                      suffixIcon: InkWell(
                        onTap: () => setState(() => isObscure = !isObscure),
                        child: Icon(
                          isObscure
                              ? Icons.visibility_off
                              : Icons.remove_red_eye,
                          color: AppColors.primaryBlue,
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    UserQuestionRow(answer: 'هل نسيت كلمة المرور ؟'),
                    const SizedBox(height: 12),
                    CustomDivider(),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        AccountsButton(
                          widget: Image.asset(Assets.assetsImagesGoogleIcon),
                          text: 'جوجل',
                        ),
                        AccountsButton(
                          widget: Image.asset(Assets.assetsImagesMeta),
                          text: 'فيسبوك',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
              child: BlocConsumer<SigninCubit, SigninState>(
                listener: (context, state) {
                  if (state is SigninSuccess) {
                    customSnackBar(
                      context,
                      'تم تسجيل الدخول',
                      AppColors.success,
                    );
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
                          setState(() {
                            autovalidateMode = AutovalidateMode.always;
                          });
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
            ),
                
            const SizedBox(height: 28),
            UserQuestionRow(
              onTap: () =>
                  Navigator.of(context).pushNamed(AppRoutes.signupView),
              mainAxisAlignment: MainAxisAlignment.center,
              ask: 'ليس لديك حساب؟ ',
              answer: 'إنشاء حساب جديد',
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
