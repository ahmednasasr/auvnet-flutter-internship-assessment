import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custome_text_field.dart';
import '../manger/cubits/login_cubit/login_bloc.dart';
import '../manger/cubits/login_cubit/login_event.dart';
import 'dont_have_account.dart';
import 'or_divider.dart';

class LoginViewBody extends StatelessWidget {
  LoginViewBody({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/nawel.png"),
              SizedBox(
                height: 24,
              ),
              CustomeTextFormField(
                controller: emailController,
                prefixIcon: Icon(
                  Icons.mail,
                  color: Color(0xff677294),
                ),
                hintText: "mail ",
                textInputType: TextInputType.emailAddress,
              ),
              SizedBox(
                height: 16,
              ),
              CustomeTextFormField(
                controller: passwordController,
                hintText: "password",
                textInputType: TextInputType.visiblePassword,
                prefixIcon: Icon(
                  Icons.password,
                  color: Color(0xff677294),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              CustomButton(
                  onpressed: () {
                    context.read<LoginBloc>().add(
                          LoginSubmitted(
                            email: emailController.text.trim(),
                            password: passwordController.text.trim(),
                          ),
                        );
                  },
                  text: "Log In"),
              SizedBox(
                height: 10,
              ),
              const DontHaveAccountWidget(),
              SizedBox(
                height: 33,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
