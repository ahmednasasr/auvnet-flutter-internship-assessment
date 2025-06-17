
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../features/auth/presentation/views/login_view.dart';
import '../../features/auth/presentation/views/signup_view.dart';
import '../../features/home/presentation/views/home_view.dart';
import '../../features/on_boarding/presentation/view/on_boarding_view.dart';
import '../../splash/presentation/view/splash_view.dart';

Route<dynamic> OnGenerateRoute(RouteSettings setting) {
  switch (setting.name) {
    case SplashView.routename:
      return MaterialPageRoute(
        builder: (context) => const SplashView(),
      );
    case LoginView.routename:
      return MaterialPageRoute(
        builder: (context) => const LoginView(),
      );

    case HomeView.routename:
      return MaterialPageRoute(
        builder: (context) => const HomeView(),
      );

    case OnBoardingView.routename:
      return MaterialPageRoute(
        builder: (context) => const OnBoardingView(),
      );
    case SignupView.routename:
      return MaterialPageRoute(
        builder: (context) => const SignupView(),
      );

    default:
      return MaterialPageRoute(
        builder: (context) => const Scaffold(),
      );
  }
}