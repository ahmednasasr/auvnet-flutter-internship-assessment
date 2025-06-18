import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/services/shared_preferences_singleton.dart';
import '../../../features/auth/presentation/views/login_view.dart';
import '../../../features/home/presentation/views/home_view.dart';
import '../../../features/on_boarding/presentation/view/on_boarding_view.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    bool isOnboardingViewSeen = Prefs.getBool("isOnboardingViewSeen") ?? false;
    Future.delayed(Duration(seconds: 5), () {
      if (isOnboardingViewSeen) {
        User? user = FirebaseAuth.instance.currentUser;

        if (user != null) {
          Navigator.pushReplacementNamed(context, HomeView.routename);
        } else {
          Navigator.pushReplacementNamed(context, LoginView.routename);
        }
      } else {
        Navigator.pushReplacementNamed(context, OnBoardingView.routename);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          "assets/images/nawel.png",
        ),
      ],
    );
  }
}
