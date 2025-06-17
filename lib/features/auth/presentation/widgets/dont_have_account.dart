import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/app_text_style.dart';
import '../views/signup_view.dart';

class DontHaveAccountWidget extends StatelessWidget {
  const DontHaveAccountWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(children: [
        TextSpan(
          recognizer: TapGestureRecognizer()..onTap=(){
            Navigator.pushNamed(context, SignupView.routename);
          },
            text: "Create an account",
            style: TextStyles.SemiBold13.copyWith(
                color: Color(0xff1877F2))
        )
      ]),
    );
  }
}
