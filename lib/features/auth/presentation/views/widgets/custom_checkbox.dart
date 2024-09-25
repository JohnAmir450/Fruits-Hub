import 'package:flutter/material.dart';
import 'package:fruit_hub/core/helper_functions/utils/app_colors.dart';

class CustomCheckBox extends StatelessWidget {
  const CustomCheckBox({super.key, required this.isChecked});
final bool isChecked;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: 24,
      height: 24,
      duration: const Duration(microseconds: 100,),
      decoration: ShapeDecoration(
        color: isChecked? AppColors.primaryColor:Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: const BorderSide(color: Color(0xffDCDEDE))
        ),
      ),child: isChecked? const Icon(Icons.check,color: Colors.white,size: 20,):const SizedBox.shrink(),
    );
  }
}
