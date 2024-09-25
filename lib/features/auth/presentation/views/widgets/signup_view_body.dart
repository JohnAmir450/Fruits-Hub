import 'package:flutter/material.dart';
import 'package:fruit_hub/core/helper_functions/utils/constants.dart';
import 'package:fruit_hub/core/helper_functions/utils/spacing.dart';
import 'package:fruit_hub/core/widgets/custom_button.dart';
import 'package:fruit_hub/core/widgets/custom_text_field.dart';
import 'package:fruit_hub/features/auth/presentation/views/widgets/already_have_account.dart';
import 'package:fruit_hub/features/auth/presentation/views/widgets/terms_and_conditions.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: SingleChildScrollView(
        child:  Column(children: [
          verticalSpace(24),
          const CustomTextFormField(hintText: 'الاسم بالكامل'),
          verticalSpace(16),
          const CustomTextFormField(hintText: 'البريد الالكتروني ',textInputType: TextInputType.emailAddress,),
          verticalSpace(16),
          const CustomTextFormField(hintText: 'كلمة المرور',textInputType: TextInputType.visiblePassword,suffixIcon: Icon(Icons.visibility),),
          verticalSpace(24),
          const TermsAndConditions(),
          verticalSpace(32),
         const CustomButton(text: 'انشاء حساب'),
         verticalSpace(32),
          const AlreadyHaveAnAccountWidget()
        ],),
      ),
    );
  }
}