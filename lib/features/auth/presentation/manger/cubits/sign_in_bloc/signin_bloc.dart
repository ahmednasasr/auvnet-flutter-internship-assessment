import 'package:auvnet_flutter_internship_assessment/features/auth/presentation/manger/cubits/sign_in_bloc/signin_event.dart';
import 'package:auvnet_flutter_internship_assessment/features/auth/presentation/manger/cubits/sign_in_bloc/signin_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../domain/repo/auth_repo.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final AuthRepo authRepo;

  SignupBloc(this.authRepo) : super(SignupInitial()) {
    on<SignupSubmitted>(_onSignupSubmitted);
  }

  Future<void> _onSignupSubmitted(
      SignupSubmitted event, Emitter<SignupState> emit) async {
    emit(SignupLoading());

    final result = await authRepo.createUserWithEmailAndPassword(
      event.email,
      event.password,
      event.name,
    );

    result.fold(
          (failure) => emit(SignupFailure(message: failure.message)),
          (userEntity) => emit(SignupSuccess(userEntity: userEntity)),
    );
  }
}
