// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fruit_hub/core/helper_functions/on_generate_routes.dart';
import 'package:fruit_hub/core/helper_functions/routes.dart';
import 'package:fruit_hub/core/helper_functions/utils/app_colors.dart';
import 'package:fruit_hub/core/helper_functions/utils/bloc_observer.dart';
import 'package:fruit_hub/core/helper_functions/utils/constants.dart';
import 'package:fruit_hub/core/services/get_it_service.dart';
import 'package:fruit_hub/core/services/shared_prefrences_singlton.dart';
import 'package:fruit_hub/firebase_options.dart';
import 'package:fruit_hub/generated/l10n.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Prefs.init();
 setup();
  Bloc.observer = MyBlocObserver();
  runApp(const FruitsHub());
}

class FruitsHub extends StatelessWidget {
  const FruitsHub({super.key});
  
  @override
  Widget build(BuildContext context) {
    bool isOnboardingViewed=Prefs.getBool(kIsOnboardingViewed);
    return MaterialApp(
      theme: ThemeData(
        fontFamily:'Cairo',
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(
          seedColor:AppColors.primaryColor
        )
      ),
      localizationsDelegates:const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            locale: const Locale('ar'),
      debugShowCheckedModeBanner: false,
      title: 'Fruits Hub',
      onGenerateRoute: onGenerateRoute,
      initialRoute:isOnboardingViewed? Routes.loginView:Routes.onBoardingView,
    );
  }
}