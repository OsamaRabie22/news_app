import 'package:flutter/material.dart';
import 'package:news/utils/app_colors.dart';

class MainLodingWidget extends StatelessWidget {
  const MainLodingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(color: AppColors.greyColor),
    );
  }
}
