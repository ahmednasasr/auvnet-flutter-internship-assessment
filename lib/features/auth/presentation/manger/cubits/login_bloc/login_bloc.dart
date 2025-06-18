import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_event.dart';
import 'login_state.dart';
import '../../../../domain/repo/auth_repo.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepo authRepo;

  LoginBloc(this.authRepo) : super(LoginInitial()) {
    on<LoginSubmitted>(_onLoginSubmitted);
  }

  Future<void> _onLoginSubmitted(
      LoginSubmitted event, Emitter<LoginState> emit) async {
    emit(LoginLoading());

    final result = await authRepo.signinWithEmailAndPassword(
      event.email,
      event.password,
    );

    result.fold(
          (failure) => emit(LoginFailure(message: failure.message)),
          (userEntity) => emit(LoginSuccess(userEntity: userEntity)),
    );
  }
}
