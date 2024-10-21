import 'package:flutter/material.dart';
import 'package:fruit_hub/core/helper_functions/extentions.dart';
import 'package:fruit_hub/core/helper_functions/routes.dart';
import 'package:fruit_hub/core/utils/app_text_styles.dart';

class BestSellingHeader extends StatelessWidget {
  const BestSellingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(children: [
      Text(
        'الاكثر مبيعًا',style: TextStyles.bold16,
      ),
      Spacer(),
      GestureDetector(
        onTap: () {
          context.pushNamed(Routes.bestSellerView);
        },
        child: Text(
          'المزيد',style: TextStyles.regular13.copyWith(color:const  Color(0xff949D9E)),
        ),
      ),
    ]);
  }
}