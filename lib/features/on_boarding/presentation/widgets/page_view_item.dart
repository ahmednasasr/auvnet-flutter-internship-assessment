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
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: height * 0.5,
          child: Stack(
            children: [
              Positioned(
                top: -height * 0.025,
                left: -width * 0.55,
                right: -width * 0.08,
                child: Image.asset(
                  image,
                  height: height * 0.375,
                  width: height * 0.375,
                ),
              ),
              Positioned(
                top: height * 0.112,
                left: -10,
                right: 0,
                child: Center(
                  child: Image.asset(
                    image2,
                    height: height * 0.375,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: height * 0.08),
        title,
        SizedBox(height: height * 0.03),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.1),
          child: Text(
            subtitle,
            textAlign: TextAlign.center,
            style: TextStyles.SemiBold13.copyWith(
              color: const Color(0xFF4E5456),
            ),
          ),
        ),
        SizedBox(height: height * 0.0625),
        CustomButton(
          onpressed: () {
            Prefs.setBool("isOnboardingViewSeen", true);
            Navigator.of(context).pushReplacementNamed(LoginView.routename);
          },
          text: "Get Started",
        ),
        SizedBox(height: height * 0.018),
        GestureDetector(
          onTap: () {
            controller.nextPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          },
          child: const Text(
            "next",
            style: TextStyle(color: Color(0xff677294)),
          ),
        ),
      ],
    );
  }
}
