import "package:flutter_bloc/flutter_bloc.dart";
import "../../../../../core/injections.dart";
import "../../../domain/repositories/auth_repo.dart";
import "../../../domain/usecases/user_login.dart";
import "../../../domain/usecases/user_signup.dart";
import "../states/auth_states.dart";

class AuthCubit extends Cubit<AuthState> {


  AuthCubit() : super(AuthInitial());
  
  void signUp({
    required String userEmail,
    required String userPass,
    required String name,
  })async {
    emit(AuthLoading());

    final eitherFailureOrUser = await UserSignup(
      sl<AuthRepo>()
    ).call(userEmail , userPass , name);

    eitherFailureOrUser.fold(
      (failure) => emit(AuthFailure()) ,
      (user)=> emit(AuthSuccess())
    );

  }


  void logIn({
    required String userEmail,
    required String userPass,
  }) async {
    emit(AuthLoading());

    final eitherFailureOrUser = await UserLogin(
      sl<AuthRepo>()
    ).call(userEmail , userPass);

    eitherFailureOrUser.fold(
      (failure) => emit(AuthFailure()) ,
      (user) => emit(AuthSuccess())
    );


  }
}
