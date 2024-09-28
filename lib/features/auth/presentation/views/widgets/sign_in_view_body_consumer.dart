import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/helper_functions/extentions.dart';
import 'package:fruit_hub/core/helper_functions/routes.dart';
import 'package:fruit_hub/core/helper_functions/utils/custom_snak_bar.dart';
import 'package:fruit_hub/core/helper_functions/utils/show_loading_dialog.dart';
import 'package:fruit_hub/features/auth/data/login_cubit/log_in_cubit.dart';
import 'package:fruit_hub/features/auth/presentation/views/widgets/login_view_body.dart';

class LoginViewBodyConsumer extends StatelessWidget {
  const LoginViewBodyConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LogInCubit, LogInState>(
      listener: (context, state) {
        if(state is LogInSuccess){
          context.pushReplacementNamed(Routes.homeView);
        }if (state is LogInFailure){
          context.pop();
          showSnackBar(context, text: state.errorMessage);
        }if(state is LogInLoading){
          showLoadingDialog(context);
        }
      },
      builder: (context, state) {
        return const LoginViewBody();
      },
    );
  }
}