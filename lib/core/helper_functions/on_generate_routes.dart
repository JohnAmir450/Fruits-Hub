import 'package:flutter/material.dart';
import 'package:fruit_hub/core/helper_functions/routes.dart';
import 'package:fruit_hub/features/onboarding/presentation/views/onboarding_view.dart';

Route onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case Routes.onBoardingView:
      return MaterialPageRoute(builder: (_) => const OnBoardingView());
    default:
      return MaterialPageRoute(builder: (_) =>  Scaffold(
        body: Center(
          child: Text('No route defined for ${settings.name}'),
        ),
      ));
  }
}