import 'package:flutter/material.dart';
import 'package:fruit_hub/core/entities/product_entitiy.dart';
import 'package:fruit_hub/core/helper_functions/routes.dart';
import 'package:fruit_hub/core/widgets/fruit_item.dart';
import 'package:fruit_hub/features/auth/presentation/views/login_view.dart';
import 'package:fruit_hub/features/auth/presentation/views/signup_view.dart';
import 'package:fruit_hub/features/home/presentation/views/best_seller_view.dart';
import 'package:fruit_hub/features/home/presentation/views/main_view.dart';
import 'package:fruit_hub/features/onboarding/presentation/views/onboarding_view.dart';

Route onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case Routes.onBoardingView:
      return MaterialPageRoute(builder: (_) => const OnBoardingView());

    case Routes.loginView:
      return MaterialPageRoute(builder: (_) => const LoginView());
    case Routes.signUpView:
      return MaterialPageRoute(builder: (_) => const SignUpView());
    case Routes.mainView:
      return MaterialPageRoute(builder: (_) => const MainView());
      case Routes.productDetailsView:
      return MaterialPageRoute(builder: (_) => FruitItem(productEntity: settings.arguments as ProductEntity,));
    case Routes.bestSellerView:
      return MaterialPageRoute(builder: (_) => const BestSellerView());
    default:
      return MaterialPageRoute(
          builder: (_) => Scaffold(
                body: Center(
                  child: Text('No route defined for ${settings.name}'),
                ),
              ));
  }
}
