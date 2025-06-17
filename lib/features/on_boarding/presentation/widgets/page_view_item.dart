import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/services/shared_preferences_singleton.dart';
import '../../../../core/utils/app_text_style.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../auth/presentation/views/login_view.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.image2,
    required this.controller,
  });

  final String image; // ellipse image
  final Widget title;
  final String subtitle;
  final String image2; // logo image
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.5,
          child: Stack(
            children: [
              Positioned(
                top: -20, // يدفع الدائرة لفوق
                left: -200,
                right: -30,
                child: Image.asset(
                  image,
                  height: 300,
                  width: 300,
                ),
              ),

              // Logo image overlapping below the ellipse
              Positioned(
                top: 90, // اتحكم في موضع اللوجو
                left: -10,
                right: 0,
                child: Center(
                  child: Image.asset(
                    image2,
                    height: 300,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 64),
        title,
        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 37),
          child: Text(
            subtitle,
            textAlign: TextAlign.center,
            style: TextStyles.SemiBold13.copyWith(
              color: const Color(0xFF4E5456),
            ),
          ),
        ),
        SizedBox(
          height: 50,
        ),
        CustomButton(
            onpressed: () {
              Prefs.setBool("isOnboardingViewSeen", true);
              Navigator.of(context).pushReplacementNamed(LoginView.routename);
            },
            text: "Get Started"),
        SizedBox(
          height: 15,
        ),
        GestureDetector(
            onTap: () {
              controller.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
            child: Text(
              "next",
              style: TextStyle(color: Color(0xff677294)),
            ))
      ],
    );
  }
}
