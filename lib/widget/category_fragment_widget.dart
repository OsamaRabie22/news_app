import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/cubits/home/home_cubit.dart';
import 'package:news/models/category.dart';
import 'package:news/utils/app_colors.dart';

class CategoryFragmentWidget extends StatelessWidget {
  final int index;
  Category category;

  CategoryFragmentWidget({
    super.key,
    required this.category,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Stack(
      alignment: (index % 2 == 0)
          ? AlignmentGeometry.bottomRight
          : AlignmentGeometry.bottomLeft,
      children: [
        ClipRRect(
          borderRadius: BorderRadiusGeometry.circular(24),
          child: Image.asset(category.image),
        ),
        Column(
          spacing: height * 0.04,
          children: [
            Text(
              category.titel,
              style: Theme.of(context).textTheme.displayLarge,
            ),

            Container(
              margin: EdgeInsets.symmetric(
                horizontal: width * 0.02,
                vertical: height * 0.02,
              ),
              padding: EdgeInsetsDirectional.only(
                start: (index % 2 == 0) ? width * 0.04 : 0,
                end: (index % 2 != 0) ? width * 0.04 : 0,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(84),
                color: AppColors.greyColor,
              ),
              child: GestureDetector(
                onTap: (){
                  context.read<HomeCubit>().selectCategory(category);
                },
                child: Row(
                  spacing: width * 0.04,
                  mainAxisSize: MainAxisSize.min,
                  textDirection: (index % 2 == 0)
                      ? TextDirection.ltr
                      : TextDirection.rtl,
                  children: [
                    Text(
                      "View All",
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),

                    CircleAvatar(
                      child: Icon(
                        (index % 2 == 0)
                            ? Icons.arrow_forward_ios
                            : Icons.arrow_back_ios,
                        color: Theme.of(context).splashColor,
                      ),
                      radius: 25,
                      backgroundColor: Theme.of(context).primaryColor,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
