import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/cubits/theme/theme_state.dart';

class ThemeCubit extends Cubit<ThemeState>{

  ThemeCubit():super(ThemeState(ThemeMode.dark));
  void changeTheme(ThemeMode themeMode){
    emit(ThemeState(themeMode));
  }
}