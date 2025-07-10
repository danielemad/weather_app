import 'package:dartz/dartz.dart';
import 'package:weather_app/core/exceptions/failure.dart';
import 'package:weather_app/features/auth_feature/domain/entities/user_entity.dart';
import 'package:weather_app/features/auth_feature/domain/repositories/auth_repo.dart';

class UserSignup {

  AuthRepo authRepo;
  
  UserSignup(this.authRepo);

  Future<Either<Failure , UserEntity>> call(String email , String pass , String name){
    return authRepo.signUp(email, pass , name);
  }
}