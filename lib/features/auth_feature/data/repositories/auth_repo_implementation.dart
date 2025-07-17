import 'package:dartz/dartz.dart';
import '../datasource/auth_remote_datasource.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/auth_repo.dart';

import '../../../../core/exceptions/failure.dart';

class AuthRepoImplementation implements AuthRepo{

  AuthRemoteDatasource authRemoteDatasource;


  AuthRepoImplementation(this.authRemoteDatasource);


  @override
  Future<Either<Failure , UserEntity>> signUp(String email, String pass, String name)async{
    try{
      return Right(
        await authRemoteDatasource.signUp(name, pass, email)
      );
    }
    catch(e){
      return Left(
        Failure(e.toString())
      );
    }

  }
  
  @override
  Future<Either<Failure , UserEntity>> signIn(String email, String pass) async {
    try{
      return Right(
        await authRemoteDatasource.signIn(email, pass)
      );
    }
    catch (e){
      return Left(
        Failure(e.toString())
      );
    }

  }

}