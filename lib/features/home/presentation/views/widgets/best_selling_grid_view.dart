import 'package:flutter/material.dart';
import 'package:fruit_hub/core/entities/product_entitiy.dart';
import 'package:fruit_hub/core/helper_functions/extentions.dart';
import 'package:fruit_hub/core/helper_functions/routes.dart';
import 'package:fruit_hub/core/widgets/fruit_item.dart';

class BestSellingGridView extends StatelessWidget {
  const BestSellingGridView({super.key,  this.itemCount,required this.products});
final int? itemCount ;
final List<ProductEntity> products;
  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      
      itemBuilder: (context, index) =>  Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: () => context.pushNamed(Routes.productDetailsView,arguments: products[index]),
          child: FruitItem(productEntity:products[index] ,)),
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 163/230,
      ),itemCount:products.length,
    );
  }
}