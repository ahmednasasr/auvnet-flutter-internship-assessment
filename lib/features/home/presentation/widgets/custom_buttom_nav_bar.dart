import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/app_text_style.dart';
import '../../domain/entities/bottom_nav_bar_entity.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: bottomNavBarItems.asMap().entries.map((e) {
          var index = e.key;
          var entity = e.value;
          return Expanded(
            flex: selectedIndex==index ? 3:1,
            child: GestureDetector(
              onTap: (){
                setState(() {
                  selectedIndex = index;
                });
              },
              child: NavigationBarItem(
                isSelected: selectedIndex == index,
                bottomNavBarEntity: entity,
              ),
            ),
          );
        }).toList(),
      ),
      width: 375,
      height: 70,
      decoration: const ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        shadows: [
          BoxShadow(
            color: Color(0x19000000),
            blurRadius: 25,
            offset: Offset(0, -2),
            spreadRadius: 0,
          ),
        ],
      ),
    );
  }
}

class InActiveItem extends StatelessWidget {
  const InActiveItem({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(image);
  }
}

class NavigationBarItem extends StatelessWidget {
  const NavigationBarItem(
      {super.key, required this.isSelected, required this.bottomNavBarEntity});
  final BottomNavBarEntity bottomNavBarEntity;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return isSelected
        ? ActiveItem(
            image: bottomNavBarEntity.activeImage,
            text: bottomNavBarEntity.name,
          )
        : InActiveItem(image: bottomNavBarEntity.InactiveImage);
  }
}

class ActiveItem extends StatelessWidget {
  final String image;
  final String text;
  const ActiveItem({super.key, required this.image, required this.text});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.only(left: 16),
        width: 78,
        height: 30,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          color: const Color(0xFFEEEEEE),
        ),
        child: Row(
          children: [
            Container(
                width: 30,
                height: 30,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  color: Color(0xFF1B5E37),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    image,
                  ),
                )),
            SizedBox(
              width: 4,
            ),
            Text(
              text,
              style:
                  TextStyles.Bold13.copyWith(color: AppColors.primaryColor),
            )
          ],
        ),
      ),
    );
  }
}
