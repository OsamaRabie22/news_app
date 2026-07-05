import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/cubits/theme/theme_cubit.dart';
import 'package:news/cubits/theme/theme_state.dart';
import 'package:news/models/category.dart';
import 'package:news/widget/category_fragment_widget.dart';

class CategoryFragment extends StatelessWidget {
  const CategoryFragment({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, themeState) {
        var isDark = themeState.themeMode == ThemeMode.dark;
        var categoriesList = Category.getCategoryList(isDark); // ✅

        return Padding(
          padding: EdgeInsets.all(width * 0.04),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Good Morning\nHere is Some News For You',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              SizedBox(height: height * 0.02),
              Expanded(
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    return CategoryFragmentWidget(
                      category: categoriesList[index],
                      index: index,
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(height: height * 0.02);
                  },
                  itemCount: categoriesList.length,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}