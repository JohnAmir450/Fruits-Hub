import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/widgets.dart';
import 'package:fruit_hub/core/helper_functions/extentions.dart';
import 'package:fruit_hub/core/helper_functions/routes.dart';
import 'package:fruit_hub/core/utils/app_colors.dart';
import 'package:fruit_hub/core/utils/constants.dart';
import 'package:fruit_hub/core/services/shared_prefrences_singlton.dart';
import 'package:fruit_hub/core/widgets/custom_button.dart';
import 'onboarding_page_view.dart';

class OnBoardingBodyViewBody extends StatefulWidget {
  const OnBoardingBodyViewBody({super.key});

  @override
  State<OnBoardingBodyViewBody> createState() => _OnBoardingBodyViewBodyState();
}

class _OnBoardingBodyViewBodyState extends State<OnBoardingBodyViewBody> {
  late PageController pageController;
  var currentPage=0;
@override
  void initState() {
    pageController=PageController();
    pageController.addListener(() {
      currentPage=pageController.page!.round();
      setState(() {
        
      });
    });
    super.initState();
  }
  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Column(children: [
       OnBoardingPageView(pageController:pageController ,),
      DotsIndicator(
        dotsCount: 2,
        decorator: DotsDecorator(
          color:currentPage==1 ? AppColors.primaryColor : AppColors.primaryColor.withOpacity(0.5),
          activeColor: AppColors.primaryColor,
        ),
      ),
      Visibility(
        visible: currentPage==1 ? true : false,
        maintainSize: true,
        maintainAnimation: true,
        maintainState: true,
        child: Padding(
          padding:  const EdgeInsetsDirectional.symmetric(horizontal: kHorizontalPadding,vertical: 43.0),
          child: CustomButton(
            text: 'ابدأ الان',
            onPressed: () {
              Prefs.setBool(kIsOnboardingViewed, true);
              context.pushReplacementNamed(Routes.loginView);
            },
          ),
        ),
      ),
    ]);
  }
}
