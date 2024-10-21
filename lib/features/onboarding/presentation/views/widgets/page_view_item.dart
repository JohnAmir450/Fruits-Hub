import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_hub/core/helper_functions/extentions.dart';
import 'package:fruit_hub/core/helper_functions/routes.dart';
import 'package:fruit_hub/core/utils/app_text_styles.dart';
import 'package:fruit_hub/core/utils/constants.dart';
import 'package:fruit_hub/core/services/shared_prefrences_singlton.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem(
      {super.key,
      required this.image,
      required this.backgroundImage,
      required this.subTitle,
      required this.title, required this.isVisible});
  final String image, backgroundImage;
  final String subTitle;
  final Widget title;
  final bool isVisible;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: MediaQuery.sizeOf(context).height * 0.5,
          child: Stack(
            children: [
              Positioned.fill(
                  child: SvgPicture.asset(
                backgroundImage,
                fit: BoxFit.fill,
              )),
              Positioned(
                right: 0,left: 0,bottom: 0,
                child: SvgPicture.asset(image,)),
                Visibility(
                  visible: isVisible,
                  child:  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: GestureDetector(
                      onTap:(){
                        Prefs.setBool(kIsOnboardingViewed, true);
                        context.pushReplacementNamed(Routes.loginView);
                      } ,
                      child: Text('تخط')),
                  ),
                )
            ],
          ),
          
        ),
        const SizedBox(height: 64,),
        title,
        const SizedBox(height: 24,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 37.0),
          child: Text(subTitle,textAlign: TextAlign.center,style: TextStyles.semiBold13.copyWith(color: const Color(0xff4E5456)),),
        ),
      ],
    );
  }
}
