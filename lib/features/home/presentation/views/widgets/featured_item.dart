import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart'  ;
import 'package:fruit_hub/core/utils/app_text_styles.dart';
import 'package:fruit_hub/core/utils/spacing.dart';
import 'package:fruit_hub/features/home/presentation/views/widgets/featured_item_button.dart';

class FeaturedItem extends StatelessWidget {
  const FeaturedItem({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Stack(
        children: [
          Align(
            alignment:  Alignment.centerLeft,
            child: Image.asset('assets/images/test_image.png',width: MediaQuery.sizeOf(context).width*0.45,),),
          Align(alignment: Alignment.centerRight,
            child: Container(
              width: MediaQuery.sizeOf(context).width*0.45,
              decoration: const BoxDecoration(
                
                  image: DecorationImage(
                      image: Svg('assets/images/featured_shape.svg',),fit: BoxFit.cover,),),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'عروض العيد',
                    style: TextStyles.regular13.copyWith(color: Colors.white),
                  ),
                  Text(
                    'خصم 25%',
                    style: TextStyles.bold19.copyWith(color: Colors.white),
                  ),
                  verticalSpace(16),
                  const FeaturedItemButton()
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
