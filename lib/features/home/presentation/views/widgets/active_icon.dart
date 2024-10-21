import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_hub/core/utils/app_colors.dart';
import 'package:fruit_hub/core/utils/app_text_styles.dart';
import 'package:fruit_hub/core/utils/spacing.dart';

class ActiveItem extends StatelessWidget {
  const ActiveItem({super.key, required this.image, required this.title});
  final String image;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsetsDirectional.only(end: 16),
        height: 40,
        decoration: ShapeDecoration(
            color: const Color(0xffEEEEEE),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30))),
        child: Row(
          children: [
            Container(
              height: 30,
              width: 30,
              padding: const EdgeInsets.all(5),
              decoration: ShapeDecoration(
                color: const Color(0xff1B5E37),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: SvgPicture.asset(
                image,
              ),
            ),
            horizontalSpace(6),
            Text(
              title,
              style: TextStyles.semiBold11
                  .copyWith(color: AppColors.primaryColor),
            )
          ],
        ));
  }
}
