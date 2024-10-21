import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fruit_hub/core/entities/product_entitiy.dart';
import 'package:fruit_hub/core/utils/app_colors.dart';
import 'package:fruit_hub/core/utils/app_text_styles.dart';
import 'package:fruit_hub/core/utils/spacing.dart';

class FruitItem extends StatelessWidget {
  final ProductEntity productEntity;
  const FruitItem({super.key, required this.productEntity});

  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          color: Color(0xff3F5F7)),
      child: Stack(
        children: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.favorite_outline,
              )),
          Column(
            children: [
              verticalSpace(8),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(productEntity.imageUrl!,fit: BoxFit.fill,)),
              verticalSpace(24),
              ListTile(
                title: Text(
                  productEntity.name,
                  style: TextStyles.bold16,
                ),
                subtitle: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                          text: '${productEntity.price} جنيه/',
                          style: TextStyles.bold13
                              .copyWith(color: AppColors.secondaryColor)),
                      TextSpan(
                        text: ' الكيلو',
                        style: TextStyles.semiBold13
                            .copyWith(color: AppColors.lightSecondaryColor),
                      ),
                    ],
                  ),
                ),
                trailing: const CircleAvatar(
                  backgroundColor: AppColors.primaryColor,
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
