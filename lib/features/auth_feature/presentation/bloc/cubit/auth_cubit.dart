import "package:flutter_bloc/flutter_bloc.dart";
import "package:weather_app/features/auth_feature/data/datasource/auth_remote_datasource.dart";
import "package:weather_app/features/auth_feature/data/repositories/auth_repo_implementation.dart";

import "package:weather_app/features/auth_feature/domain/usecases/user_login.dart";
import "package:weather_app/features/auth_feature/domain/usecases/user_signup.dart";
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
      AuthRepoImplementation(
        AuthRemoteDatasource()
      )
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
      AuthRepoImplementation(
        AuthRemoteDatasource()
      )
    ).call(userEmail , userPass);

    eitherFailureOrUser.fold(
      (failure) => emit(AuthFailure()) ,
      (user)=> emit(AuthSuccess())
    );


  }
}
