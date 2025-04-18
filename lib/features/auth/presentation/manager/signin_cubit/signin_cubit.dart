import 'package:bloc/bloc.dart';
import 'package:fruits_hub/features/auth/domain/entities/user_entity.dart';
import 'package:fruits_hub/features/auth/domain/repos/auth_repo.dart';
import 'package:meta/meta.dart';

part 'signin_state.dart';

class SigninCubit extends Cubit<SignInState> {
  SigninCubit(this._authRepo) : super(SignInInitial());
  final AuthRepo _authRepo;

  signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    emit(SignInLoading());
    var result = await _authRepo.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    result.fold(
      (failure) {
        emit(SignInFailure(errMessage: failure.errMessage));
      },
      (userEntity) {
        emit(SignInSuccess(userEntity: userEntity));
      },
    );
  }

  signInWithGoogle() async {
    emit(SignInLoading());
    var result = await _authRepo.signInWithGoogle();
    result.fold(
      (failure) {
        emit(SignInFailure(errMessage: failure.errMessage));
      },
      (userEntity) {
        emit(SignInSuccess(userEntity: userEntity));
      },
    );
  }

  signInWithFacebook() async {
    emit(SignInLoading());
    var result = await _authRepo.signInWithFacebook();
    result.fold(
      (failure) {
        emit(SignInFailure(errMessage: failure.errMessage));
      },
      (userEntity) {
        emit(SignInSuccess(userEntity: userEntity));
      },
    );
  }
}
