import 'package:ayadati/core/helper/custom_snackbar.dart';
import 'package:ayadati/core/theme/app_colors.dart';
import 'package:ayadati/core/common/domain/entites/user_entity.dart';
import 'package:ayadati/features/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:ayadati/features/profile/presentation/manager/profile_cubit/profile_cubit.dart';
import 'package:ayadati/features/profile/presentation/widgets/camera_container.dart';
import 'package:ayadati/features/profile/presentation/widgets/custom_image_profile.dart';
import 'package:ayadati/features/profile/presentation/widgets/select_gender_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileEditViewBody extends StatefulWidget {
  const ProfileEditViewBody({super.key, required this.user});
  final UserEntity user;
  @override
  State<ProfileEditViewBody> createState() => _ProfileEditViewBodyState();
}

class _ProfileEditViewBodyState extends State<ProfileEditViewBody> {
  late final TextEditingController nameController;
  late final TextEditingController phoneController;
  late final TextEditingController ageController;
  late final TextEditingController addressController;
  String? selectedGender;
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.user.name);
    ageController = TextEditingController(text: widget.user.age.toString());
    addressController = TextEditingController(text: widget.user.address);
    phoneController = TextEditingController(text: widget.user.phone);
    if (widget.user.gender == 'ذكر' || widget.user.gender == 'أنثى') {
      selectedGender = widget.user.gender;
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    ageController.dispose();
    phoneController.dispose();
    addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 10, right: 16, left: 16),
        child: Form(
          key: _globalKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              SizedBox(
                height: height * 0.20,
                child: Stack(
                  children: [
                    CustomImageProfile(height: height, width: width),
                    Positioned(
                      top: height * 0.14,
                      right: width * 0.30,
                      child: CameraContainer(),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              CustomTextFormField(
                hintText: 'أدخل الاسم',
                controller: nameController,
                title: 'الاسم الكامل',
                obscureText: false,
                suffixIcon: Icon(Icons.person, color: AppColors.primaryBlue),
              ),
              CustomTextFormField(
                hintText: 'أدخل رقم الهاتف',
                controller: phoneController,
                title: 'رقم الهاتف',
                obscureText: false,
                suffixIcon: Icon(Icons.phone, color: AppColors.primaryBlue),
              ),
              CustomTextFormField(
                hintText: 'أدخل عنوانك الحالي',
                controller: addressController,
                title: 'مكان السكن',
                obscureText: false,
                suffixIcon: Icon(
                  Icons.location_on_sharp,
                  color: AppColors.primaryBlue,
                ),
              ),
              CustomTextFormField(
                hintText: 'أدخل عمرك',
                controller: ageController,
                keyboardType: TextInputType.number,
                title: 'العمر',
                obscureText: false,
                suffixIcon: Icon(
                  Icons.accessibility_rounded,
                  color: AppColors.primaryBlue,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Text(
                    'الجنس',
                    textAlign: TextAlign.start,
                    style: TextTheme.of(context).bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              SelectGenderRow(
                selectedGender: selectedGender,
                onTapMale: () => setState(() {
                  selectedGender = 'ذكر';
                }),
                onTapFemale: () => setState(() {
                  selectedGender = 'أنثى';
                }),
              ),
              const SizedBox(height: 20),
              BlocConsumer<ProfileCubit, ProfileState>(
                listenWhen: (previous, current) =>
                    current is ProfileUpdateLoading ||
                    current is ProfileUpdateSuccess ||
                    current is ProfileUpdateError,
                listener: (context, state) {
                  if (state is ProfileUpdateSuccess) {
                    context.read<ProfileCubit>().getUserData(widget.user.uid);
                    customSnackBar(context, state.message, AppColors.success);
                    Navigator.of(context).pop();
                  } else if (state is ProfileUpdateError) {
                    customSnackBar(context, state.message, AppColors.error);
                  }
                },
                builder: (context, state) {
                  return ElevatedButton(
                    onPressed: state is ProfileUpdateLoading
                        ? null
                        : () {
                            if (_globalKey.currentState!.validate()) {
                              final user = UserEntity(
                                uid: widget.user.uid,
                                name: nameController.text.trim(),
                                email: widget.user.email,
                                phone: phoneController.text.trim(),
                                address: addressController.text.trim(),
                                age: int.tryParse(ageController.text.trim()),
                                gender: selectedGender,
                              );
                              context.read<ProfileCubit>().updateData(user);
                            } else {
                              setState(() {
                                autovalidateMode = AutovalidateMode.always;
                              });
                            }
                          },
                    child: state is ProfileUpdateLoading
                        ? SizedBox(
                            child: CircularProgressIndicator(
                              color: AppColors.background,
                            ),
                          )
                        : Text('حفظ التعديلات'),
                  );
                },
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  'إلغاء',
                  style: TextTheme.of(context).bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryBlue,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
