import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/helper_functions/utils/app_colors.dart';
import 'package:fruit_hub/core/helper_functions/utils/app_text_styles.dart';
import 'package:fruit_hub/core/helper_functions/utils/constants.dart';
import 'package:fruit_hub/core/widgets/custom_button.dart';
import 'package:fruit_hub/core/widgets/custom_text_field.dart';
import 'package:fruit_hub/features/auth/data/login_cubit/log_in_cubit.dart';
import 'package:fruit_hub/features/auth/presentation/views/widgets/dont_have_an_account_widget.dart';
import 'package:fruit_hub/features/auth/presentation/views/widgets/or_divider.dart';
import 'package:fruit_hub/features/auth/presentation/views/widgets/social_login_button.dart';

import '../../../../../core/helper_functions/utils/spacing.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<LogInCubit>();
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: kHorizontalPadding, vertical: 8),
      child: SingleChildScrollView(
        child: Form(
          key: cubit.formKey,
          child: Column(
            children: [
              verticalSpace(24),
              CustomTextFormField(
                controller: cubit.emailController,
                onChanged: (value) {
                  cubit.emailController.text = value;
                },
                hintText: 'البريد الالكتروني',
              ),
              verticalSpace(16),
              BlocBuilder<LogInCubit, LogInState>(
                builder: (context, state) {
                  return CustomTextFormField(
                      isObscured: cubit.isObscured,
                      controller: cubit.passwordController,
                      onChanged: (value) {
                        cubit.passwordController.text = value;
                      },
                      hintText: 'كلمة المرور',
                      textInputType: TextInputType.visiblePassword,
                      suffixIcon: GestureDetector(
                          onTap: () {
                            cubit.changePasswordVisibility();
                          },
                          child: cubit.suffixIcon));
                },
              ),
              verticalSpace(16),
              Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: Text(
                    ' نسيت كلمة المرور؟',
                    style: TextStyles.bold13
                        .copyWith(color: AppColors.lightPrimaryColor),
                  )),
              verticalSpace(32),
              CustomButton(
                  text: 'تسجيل الدخول',
                  onPressed: () {
                    if (cubit.formKey.currentState!.validate()) {
                      cubit.signInWithEmailAndPassword();
                    }
                  }),
              verticalSpace(32),
              const DontHaveAnAccountWidget(),
              verticalSpace(32),
              const OrDivider(),
              verticalSpace(16),
              SocialLoginButton(
                onPressed: () {
                  cubit.signInWithGoogle();
                },
                image: 'assets/images/google_icon.svg',
                label: 'متابعة بأستخدام جوجل',
              ),
               Platform.isIOS ? SocialLoginButton(
                onPressed: () {},
                image: 'assets/images/apple_icon.svg',
                label: 'متابعة بأستخدام ابل',
              ): const SizedBox.shrink(),
              SocialLoginButton(
                onPressed: () {
                  cubit.signInWithFacebook();
                },
                image: 'assets/images/facebook_icon.svg',
                label: 'متابعة بأستخدام فيسبوك',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
