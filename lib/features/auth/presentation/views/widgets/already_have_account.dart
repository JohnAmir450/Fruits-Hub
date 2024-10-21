import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fruit_hub/core/helper_functions/extentions.dart';
import 'package:fruit_hub/core/utils/app_colors.dart';
import 'package:fruit_hub/core/utils/app_text_styles.dart';

class AlreadyHaveAnAccountWidget extends StatelessWidget {
  const AlreadyHaveAnAccountWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: ' تمتلك حساب بالفعل؟ ',
            style: TextStyles.semiBold16
                .copyWith(color: const Color(0xff949D9E)),
          ),
          TextSpan(
            recognizer: TapGestureRecognizer()..onTap=(){
              context.pop();
            },
            text: ' تسجيل الدخول', 
            style: TextStyles.semiBold16
                .copyWith(color: AppColors.primaryColor),
          ),
        ],
      ),
    );
  }
}