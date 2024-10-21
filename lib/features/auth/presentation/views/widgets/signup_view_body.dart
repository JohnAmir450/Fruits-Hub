import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/utils/constants.dart';
import 'package:fruit_hub/core/utils/custom_snak_bar.dart';
import 'package:fruit_hub/core/utils/spacing.dart';
import 'package:fruit_hub/core/widgets/custom_button.dart';
import 'package:fruit_hub/core/widgets/custom_text_field.dart';
import 'package:fruit_hub/features/auth/data/sign_up_cubit/signup_cubit.dart';
import 'package:fruit_hub/features/auth/presentation/views/widgets/already_have_account.dart';
import 'package:fruit_hub/features/auth/presentation/views/widgets/password_text_form_field.dart';
import 'package:fruit_hub/features/auth/presentation/views/widgets/terms_and_conditions.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    var cubit = context.read<SignUpCubit>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: SingleChildScrollView(
        child: Form(
          key: cubit.formKey,
          child: Column(
            children: [
              verticalSpace(24),
              CustomTextFormField(
                controller: cubit.nameController,
                hintText: 'الاسم بالكامل',
                onChanged: (value) {
                  cubit.nameController.text = value;
                },
              ),
              verticalSpace(16),
              CustomTextFormField(
                controller: cubit.emailController,
                hintText: 'البريد الالكتروني ',
                textInputType: TextInputType.emailAddress,
                onChanged: (value) {
                  cubit.emailController.text = value;
                },
              ),
              verticalSpace(16),
              PasswordTextFormField(data: cubit),
              verticalSpace(24),
              const TermsAndConditions(),
              verticalSpace(32),
              CustomButton(
                text: 'انشاء حساب',
                onPressed: () {
                  if (cubit.formKey.currentState!.validate()) {
                    if (cubit.isTermsAccepted) {
                      context
                          .read<SignUpCubit>()
                          .createUserWithEmailAndPassword();
                    } else {
                      showSnackBar(context, text: 'يجب الموافقة علي الشروط');
                    }
                  }
                },
              ),
              verticalSpace(32),
              const AlreadyHaveAnAccountWidget()
            ],
          ),
        ),
      ),
    );
  }
}
