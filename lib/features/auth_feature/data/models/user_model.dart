import 'package:weather_app/features/auth_feature/domain/entities/user_entity.dart';


class UserModel extends UserEntity{
  
  
  UserModel({
    required super.id, 
    required super.name, 
    required super.email,
    required super.pass
  });


  factory UserModel.fromJson(Map<String , dynamic> json){
    return UserModel(
      id: json["id"],
      name: json["name"],
      email: json["email"],
      pass: json["pass"]
    );
  }

  Map<String , dynamic>  toJon() => {
    "id" : id,
    "email" : email,
    "pass" : pass,
    "name" : name,
  };
}