
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../core/services/get_it.dart';
import '../../../home/presentation/views/home_view.dart';
import '../../domain/repo/auth_repo.dart';
import '../manger/cubits/login_cubit/login_cubit.dart';
import '../manger/cubits/login_cubit/login_state.dart';
import '../widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  static const routename = "login";
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(getIt<AuthRepo>()),
      child: Scaffold(
        body: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is LoginSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('تم التسجيل بنجاح!')),
              );
              Navigator.pushNamed(context, HomeView.routename);
            }

            if (state is LoginFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('فشل في تسجيل الدخول: ${state.message}')),
              );
            }
          },
          builder: (context, state) {
            return ModalProgressHUD(
              inAsyncCall: state is LoginLoading ? true : false,
              child:  LoginViewBody(),
            );
          },
        ),
      ),
    );
  }
}
