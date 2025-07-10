import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/utils/themes/dark_theme.dart';
import 'package:weather_app/features/auth_feature/presentation/bloc/cubit/auth_cubit.dart';
import 'package:weather_app/features/splash_feature/presentation/screens/splash_screen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    BlocProvider<AuthCubit>(
      create: (context) => AuthCubit(),
      child: const MyApp()
    )
  );
} 

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppDarkTheme.theme,
      home: SplashScreen()
    );
  }
}