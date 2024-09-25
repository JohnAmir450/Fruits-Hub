import 'package:flutter/material.dart';
import 'package:fruit_hub/core/helper_functions/utils/app_colors.dart';
import 'package:fruit_hub/core/helper_functions/utils/app_text_styles.dart';
import 'package:fruit_hub/core/helper_functions/utils/constants.dart';
import 'package:fruit_hub/core/widgets/custom_button.dart';
import 'package:fruit_hub/core/widgets/custom_text_field.dart';
import 'package:fruit_hub/features/auth/presentation/views/widgets/dont_have_an_account_widget.dart';
import 'package:fruit_hub/features/auth/presentation/views/widgets/or_divider.dart';
import 'package:fruit_hub/features/auth/presentation/views/widgets/social_login_button.dart';

import '../../../../../core/helper_functions/utils/spacing.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding,vertical: 8),
      child: SingleChildScrollView(
        child: Column(
          children: [
            verticalSpace(24),
            const CustomTextFormField(
              hintText: 'البريد الالكتروني',
            ),
            verticalSpace(16),
            const CustomTextFormField(
              hintText: 'كلمة المرور',
              textInputType: TextInputType.visiblePassword,
              suffixIcon: Icon(
                Icons.visibility,
              ),
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
            CustomButton(text: 'تسجيل الدخول', onPressed: () {}),
            verticalSpace(32),
            const DontHaveAnAccountWidget(),
            verticalSpace(32),
           const OrDivider(),
           verticalSpace(16),
           SocialLoginButton(onPressed: (){}, image:'assets/images/google_icon.svg' ,label: 'متابعة بأستخدام جوجل',),
           SocialLoginButton(onPressed: (){}, image:'assets/images/apple_icon.svg' ,label: 'متابعة بأستخدام ابل',),
           SocialLoginButton(onPressed: (){}, image:'assets/images/facebook_icon.svg' ,label: 'متابعة بأستخدام فيسبوك',)
            
          ],
        ),
      ),
    );
  }
}


