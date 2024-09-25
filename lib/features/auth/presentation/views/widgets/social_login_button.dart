import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_hub/core/helper_functions/utils/app_text_styles.dart';

class SocialLoginButton extends StatelessWidget {
  const SocialLoginButton(
      {super.key, this.onPressed, required this.label, required this.image});

  final void Function()? onPressed;
  final String label;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: SizedBox(
        width: double.infinity,
        height: 56,
        child: TextButton(
          style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  side:const BorderSide(color: Color(0xffDCDEDE)))),
          onPressed: onPressed,
          child: ListTile(
            visualDensity: const VisualDensity(
              vertical: VisualDensity.minimumDensity,),
            leading: SvgPicture.asset(image),
            title: Text(
              label,
              style: TextStyles.semiBold16,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
