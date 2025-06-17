import 'package:bloc/bloc.dart';
import '../../../../domain/repo/auth_repo.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authRepo) : super(LoginInitial());

  final AuthRepo authRepo;

  Future<void> signinWithEmailAndPassword(String email, String password) async {
    emit(LoginLoading());
    print("LoginCubit: بدأ تسجيل الدخول");

    final result = await authRepo.signinWithEmailAndPassword(email, password);

    result.fold(
      (failure) {
        print("LoginCubit: فشل تسجيل الدخول - ${failure.message}");
        emit(LoginFailure(message: failure.message));
      },
      (userEntity) {
        print("LoginCubit: نجاح تسجيل الدخول - ${userEntity.email}");
        emit(LoginSuccess(userEntity: userEntity));
      },
    );
  }
}
