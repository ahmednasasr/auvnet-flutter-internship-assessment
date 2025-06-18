import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custome_text_field.dart';
import '../manger/cubits/sign_in_bloc/signin_bloc.dart';
import '../manger/cubits/sign_in_bloc/signin_event.dart';
import 'dont_have_account.dart';

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
  bool obsecured = true;
  late String username, email, password;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late bool istermsAccepted = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Form(
            key: formKey,
            autovalidateMode: autovalidateMode,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/nawel.png"),
                SizedBox(
                  height: 24,
                ),
                CustomeTextFormField(
                  onSaved: (value) {
                    username = value!;
                  },
                  prefixIcon: Icon(Icons.drive_file_rename_outline,color: Color(0xff677294),),
                  hintText: "Full Name",
                  textInputType: TextInputType.name,
                ),
                SizedBox(
                  height: 16,
                ),
                CustomeTextFormField(
                  onSaved: (value) {
                    email = value!;
                  },
                  prefixIcon: Icon(Icons.mail,color: Color(0xff677294),),
                  hintText: "mail ",
                  textInputType: TextInputType.emailAddress,
                ),
                SizedBox(
                  height: 16,
                ),
                CustomeTextFormField(
                  onSaved: (value) {
                    password = value!;
                  },
                  obscureText: obsecured,
                  hintText: "password",
                  textInputType: TextInputType.visiblePassword,
                  prefixIcon: Icon(Icons.password,color: Color(0xff677294),),

                ),
                SizedBox(
                  height: 16,
                ),
                CustomButton(
                  onpressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      context.read<SignupBloc>().add(
                        SignupSubmitted(
                          email: email.trim(),
                          password: password.trim(),
                          name: username.trim(),
                        ),
                      );
                    } else {
                      setState(() {
                        autovalidateMode = AutovalidateMode.always;
                      });
                    }
                  },
                  text: "Sign Up",
                ),
                SizedBox(
                  height: 15,
                ),
                const DontHaveAccountWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
