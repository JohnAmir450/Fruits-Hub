import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/utils/app_colors.dart';
import 'package:fruit_hub/core/utils/app_text_styles.dart';
import 'package:fruit_hub/core/utils/spacing.dart';
import 'package:fruit_hub/features/auth/data/sign_up_cubit/signup_cubit.dart';
import 'package:fruit_hub/features/auth/presentation/views/widgets/custom_checkbox.dart';

class TermsAndConditions extends StatefulWidget {
  const TermsAndConditions({
    super.key,
  });

  @override
  State<TermsAndConditions> createState() => _TermsAndConditionsState();
}

class _TermsAndConditionsState extends State<TermsAndConditions> {
  
  @override
  Widget build(BuildContext context) {
    var cubit=context.read<SignUpCubit>();
    return Row(
      children: [
        GestureDetector(
            onTap: () {
              setState(() {
                cubit.isTermsAccepted =
                    !cubit.isTermsAccepted;
              });
            },
            child: CustomCheckBox(
              isChecked: cubit.isTermsAccepted,
            )),
        horizontalSpace(16),
        Expanded(
          child: Text.rich(TextSpan(children: [
            TextSpan(
                text: 'من خلال إنشاء حساب فإنك توافق على ',
                style: TextStyles.semiBold13
                    .copyWith(color: const Color(0xff949D9E))),
            TextSpan(
                text: ' الشروط الأحكام الخاصة بنا',
                style: TextStyles.semiBold13
                    .copyWith(color: AppColors.lightPrimaryColor))
          ])),
        )
      ],
    );
  }
}
