import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/cubits/theme/theme_cubit.dart';
import 'package:news/cubits/theme/theme_state.dart';
import 'package:news/screens/home_screen.dart';
import 'package:news/utils/app_theme.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ThemeCubit>(
      create: (context)=>ThemeCubit(),
      child: BlocBuilder<ThemeCubit,ThemeState>(
        builder: (context,state){
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: state.themeMode,
            initialRoute: HomeScreen.routeName,
            routes: {HomeScreen.routeName: (_) => HomeScreen()},
          );
        },
      )
    );
  }
}
