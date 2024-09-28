import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/widgets/custom_text_field.dart';
import 'package:fruit_hub/features/auth/data/sign_up_cubit/signup_cubit.dart';

class PasswordTextFormField extends StatelessWidget {
  const PasswordTextFormField({
    super.key,
    required this.data,
  });

  final SignUpCubit data;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      builder: (context, state) {
        return CustomTextFormField(
          controller: data.passwordController,
          isObscured: data.isObscured,
          hintText: 'كلمة المرور',
          textInputType: TextInputType.visiblePassword,
          suffixIcon: GestureDetector(
              onTap: () {
                data.changePasswordVisibility();
              },
              child: data.suffixIcon),
          onChanged: (value) {
            data.passwordController.text = value;
          },
        );
      },
    );
  }
}
