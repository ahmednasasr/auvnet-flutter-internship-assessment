import 'package:bloc/bloc.dart';
import '../../../../domain/repo/auth_repo.dart';
import 'signin_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this.authrepo) : super(SignupInitial());

  final AuthRepo authrepo;

  Future<void> createUserWithEmailAndPassword(
      String email, String password, String name) async {
    emit(SignupLoading());

    final result =
        await authrepo.createUserWithEmailAndPassword(email, password, name);

    result.fold(
      (failure) => emit(SignupFailure(message: failure.message)),
      (userEntity) => emit(SignupSuccess(userEntity: userEntity)),
    );
  }




}
