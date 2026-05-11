import 'package:flutter/material.dart';
import 'package:news/api/api_manager.dart';
import 'package:news/models/source_response.dart';
import 'package:news/utils/app_colors.dart';
import 'package:news/widget/main_error_widget.dart';
import 'package:news/widget/main_loding_widget.dart';
import 'package:news/widget/news_widget.dart';

class CategoryDetails extends StatefulWidget {
  CategoryDetails({super.key});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourceResponse>(
      future: ApiManager.getSources(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: MainLodingWidget());
        } else if (snapshot.hasError) {
          return Center(
            child: MainErrorWidget(
              errorMessage: 'Something went wrong',
              onPressed: () {
                ApiManager.getSources();
                setState(() {});
              },
            ),
          );
        }
        if (snapshot.data?.status != 'ok') {
          return Center(
            child: MainErrorWidget(
              errorMessage: snapshot.data!.message!,
              onPressed: () {
                ApiManager.getSources();
                setState(() {});
              },
            ),
          );
        } else {
          var sourcesList = snapshot.data?.sources ?? [];
          return Column(
            children: [
              DefaultTabController(
                length: sourcesList.length,
                initialIndex: selectedIndex,
                child: TabBar(
                  onTap: (value) {
                    selectedIndex = value;
                    setState(() {});
                  },
                  indicatorColor: Theme.of(context).splashColor,
                  labelStyle: Theme.of(context).textTheme.bodySmall,
                  unselectedLabelStyle: Theme.of(context).textTheme.labelMedium,
                  dividerColor: AppColors.transparentColor,
                  tabAlignment: TabAlignment.start,
                  isScrollable: true,
                  tabs: sourcesList
                      .map((e) => Tab(child: Text(e.name ?? '')))
                      .toList(),
                ),
              ),
              Expanded(
                child: NewsWidget(
                  sourceId: sourcesList[selectedIndex].id ?? '',
                ),
              ),
            ],
          );
        }
      },
    );
  }
}
