import 'package:ayadati/core/helper/custom_snackbar.dart';
import 'package:ayadati/core/routes/app_routes.dart';
import 'package:ayadati/core/theme/app_colors.dart';
import 'package:ayadati/features/auth/presentation/manager/signup_cubit/signup_cubit.dart';
import 'package:ayadati/features/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:ayadati/features/auth/presentation/widgets/medical_auth_header.dart';
import 'package:ayadati/features/auth/presentation/widgets/user_question_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  bool isObscure = true;
  bool isChecked = false;

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _globalKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const MedicalAuthHeader(),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Transform.translate(
                offset: const Offset(0, -30),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppColors.surface,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withAlpha(10),
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          CustomTextFormField(
                            title: 'الاسم الكامل',
                            hintText: 'أدخل اسمك الثلاثي',
                            controller: nameController,
                            obscureText: false,
                            suffixIcon: const Icon(
                              Icons.person,
                              color: AppColors.primaryBlue,
                            ),
                          ),
                          const SizedBox(height: 16),
                          CustomTextFormField(
                            title: 'رقم الهاتف',
                            hintText: '09XXXXXXXX',
                            controller: phoneController,
                            obscureText: false,
                            suffixIcon: const Icon(
                              Icons.phone,
                              color: AppColors.primaryBlue,
                            ),
                          ),
                          const SizedBox(height: 16),
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
                        ],
                      ),
                    ),

                    const SizedBox(height: 30),
                  
                    BlocConsumer<SignupCubit, SignupState>(
                        listener: (context, state) {
                          if (state is SignupSuccess) {
                            customSnackBar(
                              context,
                              'تم انشاء الحساب',
                              AppColors.success,
                            );
                            Navigator.of(context).pushNamed(AppRoutes.mainView);
                          } else if (state is SignupFailure) {
                            customSnackBar(
                              context,
                              state.message,
                              AppColors.error,
                            );
                          }
                        },
                        builder: (context, state) {
                          final isLoading = state is SignupLoading;
                          return SizedBox(
                            width: double.infinity,
                            height: 55,
                            child: ElevatedButton(
                              onPressed: () {
                                if (_globalKey.currentState!.validate()) {
                                  context.read<SignupCubit>().signUp(
                                    name: nameController.text,
                                    phone: phoneController.text,
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
                                )
                            )
                                  : const Text('إنشاء حساب'),
                          ));
                        },
                      ),
               

                    const SizedBox(height: 40),

                    UserQuestionRow(
                      onTap: () => Navigator.of(context).pop(),
                      mainAxisAlignment: MainAxisAlignment.center,
                      ask: 'لديك حساب بالفعل؟ ',
                      answer: 'تسجيل الدخول',
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
