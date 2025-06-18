import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../../../core/services/get_it.dart';
import '../../domain/repo/auth_repo.dart';
import '../manger/cubits/sign_up_cubit/signin_bloc.dart';
import '../manger/cubits/sign_up_cubit/signin_state.dart';
import '../widgets/signup_view_body.dart';

class SignupView extends StatelessWidget {
  static const routename = "SignUp";

  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupBloc(getIt<AuthRepo>()),
      child: Scaffold(
        body: BlocConsumer<SignupBloc, SignupState>(
          listener: (context, state) {
            if (state is SignupSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('تم انشاء الحساب بنجاح')),
              );
              Navigator.pop(context);
            }

            if (state is SignupFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('فشل في انشاء الحساب: ${state.message}')),
              );
            }
          },
          builder: (context, state) {
            return ModalProgressHUD(
              inAsyncCall: state is SignupLoading,
              child: const SignupViewBody(),
            );
          },
        ),
      ),
    );
  }
}
