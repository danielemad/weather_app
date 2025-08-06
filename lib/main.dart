import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/injections.dart';
import 'core/utils/themes/dark_theme.dart';
import 'features/ai_feature/presentation/cubits/prediction_cubit.dart';
import 'features/auth_feature/presentation/bloc/cubit/auth_cubit.dart';
import 'features/home_feature/presentation/cubits/home_cubit/home_cubit.dart';
import 'features/splash_feature/presentation/screens/splash_screen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // Lock orientation to portrait only
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  init();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<HomeCubit>(
          create: (_) => HomeCubit(),
        ),
        BlocProvider<AuthCubit>(
          create: (_) => AuthCubit(),
        ),
        BlocProvider<PredictionCubit>(
          create: (_) => PredictionCubit(),
        ),
      ],
      child: MyApp(), // or any widget that needs these blocs
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