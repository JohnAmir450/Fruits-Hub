import 'package:flutter/material.dart';
import 'package:fruit_hub/core/helper_functions/utils/app_colors.dart';
import 'package:fruit_hub/core/helper_functions/utils/app_text_styles.dart';
import 'package:fruit_hub/features/onboarding/presentation/views/widgets/page_view_item.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({super.key, required this.pageController});
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    List<PageViewItem> pages =  [
      PageViewItem(
        isVisible: true,
          image: 'assets/images/page_view_item1_image.svg',
          backgroundImage: 'assets/images/page_view_item1_background_image.svg',
          subTitle:
              'اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.',
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('مرحبًا بك في',style:TextStyles.bold23),
              Text(' HUB',style:  TextStyles.bold23.copyWith(color:AppColors.secondaryColor )),
              Text('Fruit',style:TextStyles.bold23.copyWith(color:AppColors.primaryColor )),
              
            ],
          )),
       const PageViewItem(
        isVisible: false,
          image: 'assets/images/page_view_item2_image.svg',
          backgroundImage: 'assets/images/page_view_item2_background_image.svg',
          subTitle:
              'نقدم لك افضل الفواكه المختارة بعناية، اطلع على التفاصيل والصور والتقيممات لتتأكد من اختيار الفاكهة المثالية',
          title: Text('ابحث وتسوق',style: TextStyles.bold23,)),
    ];

    return Expanded(
        child: PageView.builder(
          physics: const BouncingScrollPhysics(),
          controller: pageController,
      itemBuilder: (context, index) => pages[index],
      itemCount: pages.length,
    ));
  }
}
