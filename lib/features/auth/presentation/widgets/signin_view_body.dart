import 'package:ayadati/core/helper/custom_snackbar.dart';
import 'package:ayadati/core/routes/app_routes.dart';
import 'package:ayadati/core/theme/app_colors.dart';
import 'package:ayadati/core/utils/app_images.dart';
import 'package:ayadati/features/auth/presentation/manager/social_auth_cubit/social_auth_cubit.dart';
import 'package:ayadati/features/auth/presentation/widgets/accounts_button.dart';
import 'package:ayadati/features/auth/presentation/widgets/bloc_consumer_signin_button.dart';
import 'package:ayadati/features/auth/presentation/widgets/build_header_signin.dart';
import 'package:ayadati/features/auth/presentation/widgets/custom_divider.dart';
import 'package:ayadati/features/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:ayadati/features/auth/presentation/widgets/user_question_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

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
      child: BlocConsumer<SocialauthCubit, SocialAuthState>(
        listener: (context, state) {
          if (state is SocialAuthSuccess) {
            if (state.user != null) {
              customSnackBar(context, 'نجح تسجيل الدخول', AppColors.success);
              Navigator.of(context).pushReplacementNamed(AppRoutes.mainView);
            }
          } else if (state is SocialAuthFailure) {
            customSnackBar(context, state.message, AppColors.error);
          }
        },
        builder: (context, state) {
          return ModalProgressHUD(
            inAsyncCall: state is SocialAuthLoading,
            opacity: 0.2,
            color: Colors.black,
            progressIndicator: const Center(
              child: SizedBox(
                height: 50,
                width: 50,
                child: CircularProgressIndicator(color: AppColors.primaryBlue),
              ),
            ),
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
                            style: TextTheme.of(context).displayMedium
                                ?.copyWith(
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
                              onTap: () =>
                                  setState(() => isObscure = !isObscure),
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
                                widget: Image.asset(
                                  Assets.assetsImagesGoogleIcon,
                                ),
                                text: 'جوجل',
                                onTap: () {
                                  context
                                      .read<SocialauthCubit>()
                                      .signInWithGoogle();
                                },
                              ),
                              AccountsButton(
                                widget: Image.asset(Assets.assetsImagesMeta),
                                text: 'فيسبوك',
                                onTap: () {
                                  context
                                      .read<SocialauthCubit>()
                                      .signInWithFacebook();
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  BlocConsumerSignInButton(
                    globalKey: _globalKey,
                    emailController: emailController,
                    passwordController: passwordController,
                    voidCallback: () {
                      setState(() {
                        autovalidateMode = AutovalidateMode.always;
                      });
                    },
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
        },
      ),
    );
  }
}
