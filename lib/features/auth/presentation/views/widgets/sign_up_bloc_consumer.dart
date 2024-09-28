import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/helper_functions/extentions.dart';
import 'package:fruit_hub/core/helper_functions/routes.dart';
import 'package:fruit_hub/core/helper_functions/utils/custom_snak_bar.dart';
import 'package:fruit_hub/core/helper_functions/utils/show_loading_dialog.dart';
import 'package:fruit_hub/features/auth/data/sign_up_cubit/signup_cubit.dart';
import 'package:fruit_hub/features/auth/presentation/views/widgets/signup_view_body.dart';

class SignUpViewBlocConsumer extends StatelessWidget {
  const SignUpViewBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignUpSuccess) {
          
          context.pushReplacementNamed(Routes.homeView);
        }  if (state is SignUpFailure) {
          context.pop();
          showSnackBar(context, text: state.message,);
          

          
        } if(state is SignUpLoading) {
           showLoadingDialog(context);
        } if(state is ChangePasswordVisibility){}
      },
      builder: (context, state) {
        return const SignUpViewBody();
      },
    );
  }

  
}
