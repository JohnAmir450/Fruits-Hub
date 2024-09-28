import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/services/get_it_service.dart';
import 'package:fruit_hub/core/widgets/custom_app_bar.dart';
import 'package:fruit_hub/features/auth/data/login_cubit/log_in_cubit.dart';
import 'package:fruit_hub/features/auth/domain/repos/auth_repo.dart';
import 'package:fruit_hub/features/auth/presentation/views/widgets/sign_in_view_body_consumer.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LogInCubit(getIt<AuthRepo>()),
      child: Scaffold(
        appBar:
            buildAppBar(context, visibleLeading: false, title: 'تسجيل الدخول'),
        body: const LoginViewBodyConsumer(),
      ),
    );
  }
}


