import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/auth_feature/presentation/bloc/cubit/auth_cubit.dart';
import 'package:weather_app/features/auth_feature/presentation/bloc/states/auth_states.dart';
import 'package:weather_app/features/auth_feature/presentation/widgets/signin_form.dart';
import 'package:weather_app/features/auth_feature/presentation/widgets/signup_form.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {

  bool isLogin = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding:const EdgeInsets.all(24),
          child: Container(
            padding: EdgeInsets.all(24),
            decoration: BoxDecoration(
              border: Border.all()
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("WEATHER APP"),
                  SizedBox(height:24),
                  BlocBuilder<AuthCubit , AuthState>(

                    builder:(context , state){
                      if(state is AuthLoading){
                        return CircularProgressIndicator();
                      }
                      return Column(
                        children: [
                          SizedBox(height: 20,),
                          isLogin ? SigninForm() : SignupForm(),
                          TextButton(
                            child: isLogin ? 
                            Text("create an account") : 
                            Text("already have an account ?") ,
                            onPressed: (){
                              setState((){
                                isLogin = !isLogin;
                              });
                            },
                          ),
                        ]
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      )
    );
  }
}