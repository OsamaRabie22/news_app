import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/cubits/home/home_cubit.dart';
import 'package:news/cubits/home/home_state.dart';
import 'package:news/cubits/theme/theme_cubit.dart';
import 'package:news/cubits/theme/theme_state.dart';
import 'package:news/screens/category/category_details.dart';
import 'package:news/screens/home/category_fragment.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = "HomeScreen";

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create: (context) => HomeCubit(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          var isDark = context.read<ThemeCubit>().state.themeMode== ThemeMode.dark;;
          return Scaffold(
          appBar: AppBar(
              actions: [
                IconButton(onPressed: (){
           isDark?context.read<ThemeCubit>().changeTheme(ThemeMode.light):context.read<ThemeCubit>().changeTheme(ThemeMode.dark);
          }, icon: Icon(
                    isDark? Icons.light_mode:Icons.dark_mode))
              ],
              title: Text(
                state is ShowCategories ? "Home" : "News",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              leading: state is ShowCategories
                  ? null
                  : IconButton(
                      onPressed: () {
                        context.read<HomeCubit>().goBack();
                      },
                      icon: const Icon(Icons.arrow_back_ios),
                    ),
            ),
            body: state is ShowCategories
                ? CategoryFragment()
                : CategoryDetails(
                    categoryId: (state as ShowCategoryDetails).category.id,
                  ),
          );
        },
      ),
    );
  }
}
