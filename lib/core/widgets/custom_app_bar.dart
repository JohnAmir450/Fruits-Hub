 import 'package:flutter/material.dart';
import 'package:fruit_hub/core/helper_functions/utils/app_text_styles.dart';

AppBar buildAppBar(context, {required String title}) {
    return AppBar(
      leading: GestureDetector(
        onTap:(){
          context.pop();
        } ,
        child: const Icon(Icons.arrow_back_ios)),
      centerTitle: true,
      title: Text(title, style: TextStyles.bold19,),
    );
  }