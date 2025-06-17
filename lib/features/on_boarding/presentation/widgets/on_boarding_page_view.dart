import 'package:auvnet_flutter_internship_assessment/features/on_boarding/presentation/widgets/page_view_item.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/app_text_style.dart';

class OnBoardingPageView extends StatelessWidget {
  OnBoardingPageView({super.key, required this.pageController});
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: [
        PageViewItem(
          image: "assets/images/Ellipse 153.png",
          image2: "assets/images/nawel.png",
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("all-in-one delivery", style: TextStyles.Bold23),
            ],
          ),
          subtitle:
              "Order groceries, medicines, and meals delivered straight to your door",
          controller: pageController,
        ),
        PageViewItem(
          image: "assets/images/Ellipse 153.png",
          image2: "assets/images/nawel.png",
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("User-to-User Delivery",
                  style: TextStyles.Bold23.copyWith(color: Colors.black)),
            ],
          ),
          subtitle: "Send or receive items from other users quickly and easily",
          controller: pageController,
        ),
        PageViewItem(
          image: "assets/images/Ellipse 153.png",
          image2: "assets/images/nawel.png",
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Sales & Discounts",
                  style: TextStyles.Bold23.copyWith(color: Colors.black)),
            ],
          ),
          subtitle: "Discover exclusive sales and deals every day",
          controller: pageController,
        ),
      ],
    );
  }
}
