import 'package:dartz/dartz.dart';
import '../../../../core/exceptions/failure.dart';
import '../entities/user_entity.dart';
import '../repositories/auth_repo.dart';

class UserLogin {
  AuthRepo authRepo;

  UserLogin(this.authRepo);

  // this function is used to make the object callable like functions
  Future<Either<Failure , UserEntity>> call(String email , String pass){
    return authRepo.signIn(email, pass);
  }
}