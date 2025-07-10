import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:weather_app/features/auth_feature/presentation/bloc/cubit/auth_cubit.dart";
import "package:weather_app/shared_components/custom_text_field.dart";
import "package:weather_app/shared_components/primary_button.dart";

class SigninForm extends StatelessWidget {

  SigninForm({super.key});

  final _key = GlobalKey<FormState>();



  @override
  Widget build(BuildContext context) {
    String email = "";
    String pass = "";
    return Form(
      key: _key,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CustomTextField(
            icon: Icons.mail,
            hint: "email",
            onSaved: (val) {
              email =  val!.trim();
            },
          ),
          SizedBox(height:20),
          CustomTextField(
            icon: Icons.lock,
            hint: "password",
            obscureText: true,
            onSaved: (val) {
              pass = val!.trim();
            },
          ),
          SizedBox(height:20),
          PrimaryButton(
            text: "sign in",
            onPressed: (){
              if(_key.currentState!.validate()){
                _key.currentState!.save();
                BlocProvider.of<AuthCubit>(context).logIn(userEmail: email, userPass: pass);
              }
            },
          )
        ],
      ),
    );
  }
}