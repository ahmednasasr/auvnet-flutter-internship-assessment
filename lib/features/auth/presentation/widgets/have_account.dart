import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/app_text_style.dart';

class HaveAccount extends StatelessWidget {
  const HaveAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(children: [
        TextSpan(
            text: "تمتلك حساب بالفعل؟",
            style: TextStyles.SemiBold13.copyWith(
                color: Color(0xFF616A6B))),
        TextSpan(
            text: " ",
            style: TextStyles.SemiBold13.copyWith(
                color: AppColors.primaryColor)),
        TextSpan(
            recognizer: TapGestureRecognizer()..onTap=(){
              Navigator.pop(context);
            },
            text: "تسجيل دخول",
            style: TextStyles.SemiBold13.copyWith(
                color: AppColors.primaryColor)
        )
      ]),
    );
  }
}
