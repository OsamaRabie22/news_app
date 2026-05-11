import 'package:flutter/material.dart';
import 'package:news/api/api_manager.dart';
import 'package:news/widget/main_error_widget.dart';
import 'package:news/widget/main_loding_widget.dart';
import 'package:news/widget/news_item.dart';

class NewsWidget extends StatelessWidget {
  String sourceId;

  NewsWidget({super.key, required this.sourceId});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.getNewsById(sourceId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return MainLodingWidget();
        } else if (snapshot.hasError) {
          return MainErrorWidget(
            errorMessage: "errorMessage",
            onPressed: () {
              ApiManager.getNewsById(sourceId);
            },
          );
        } else {
          var articles = snapshot.data?.articles ?? [];
          if (articles.isEmpty) {
            return Center(
              child: Text(
                'no data',
                style: Theme.of(context).textTheme.labelLarge,
              ),
            );
          }
            return ListView.builder(
              itemBuilder: (context, index) {
                return NewsItem(news: articles[index],);
              },
              itemCount: articles.length,
            );

        }
      },
    );
  }
}
