import 'package:dartz/dartz.dart';
import '../../../../core/exceptions/failure.dart';
import '../entities/user_entity.dart';

abstract class AuthRepo {
 Future<Either<Failure , UserEntity>> signIn(String email , String pass);

 Future<Either<Failure , UserEntity>> signUp(String email , String pass , String name);
}