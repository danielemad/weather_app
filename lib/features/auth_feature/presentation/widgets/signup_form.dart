import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:weather_app/features/auth_feature/presentation/bloc/cubit/auth_cubit.dart";

class SignupForm extends StatelessWidget {

  SignupForm({super.key});

  final _key = GlobalKey<FormState>();



  @override
  Widget build(BuildContext context) {
    String email = "";
    String pass = "";
    String name = "";
    return Form(
      key: _key,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              hintText: "name",
              hintStyle: TextStyle(
                color: Colors.grey
              ),
              prefixIcon: Icon(Icons.mail),
            ),
            validator: (val){
              if(val == null || val.isEmpty){
                return val;
              }
              return null;
            },
            onSaved: (val) {
              name = val!;
            },
          ),
          SizedBox(height:20),
          TextFormField(
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              hintText: "email",
              hintStyle: TextStyle(
                color: Colors.grey
              ),
              prefixIcon: Icon(Icons.mail),
            ),
            validator: (val){
              if(val == null || val.isEmpty){
                return val;
              }
              return null;
            },
            onSaved: (val) {
              email = val!;
            },
          ),
          SizedBox(height:20),
          TextFormField(
            textInputAction: TextInputAction.done,
            obscureText: true,
            decoration: InputDecoration(
              hintText: "password",
              hintStyle: TextStyle(
                color: Colors.grey
              ),
              prefixIcon: Icon(Icons.lock),
            ),
            validator: (val){
              if(val == null || val.isEmpty){
                return val;
              }
              return null ;
            },
            onSaved: (val) {
              pass = val!;
            },
          ),
          SizedBox(height:20),
          ElevatedButton(
            child: Text("sign up"),
            onPressed: (){
              if(_key.currentState!.validate()){
                _key.currentState!.save();

                BlocProvider.of<AuthCubit>(context).signUp(
                  userEmail: email, 
                  userPass: pass,
                  name: name
                );
                
              }
            },
          )
        ],
      ),
    );
  }
}