import 'package:flutter/material.dart';
import 'package:news/models/category.dart';
import 'package:news/widget/category_fragment_widget.dart';

class CategoryFragment extends StatelessWidget {
  CategoryFragment({super.key});

  List<Category> categoriesList = [];

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    categoriesList = Category.getCategoryList(true);
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
                return CategoryFragmentWidget(category: categoriesList[index],index: index,);
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
  }
}
