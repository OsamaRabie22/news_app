import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/cubits/news/news_cubit.dart';
import 'package:news/cubits/news/news_state.dart';
import 'package:news/widget/main_error_widget.dart';
import 'package:news/widget/main_loading_widget.dart';
import 'package:news/widget/news_item.dart';

class NewsWidget extends StatelessWidget {
  final String sourceId;

  const NewsWidget({super.key, required this.sourceId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubit, NewsState>(
      builder: (context, state) {
        if (state is NewsLoading) {
          return MainLoadingWidget();
        } else if (state is NewsError) {
          return MainErrorWidget(
            errorMessage: state.message,
            onPressed: () {
              context.read<NewsCubit>().getNews(sourceId);
            },
          );
        } else if (state is NewsSuccess) {
          if (state.articles.isEmpty) {
            return Center(
              child: Text(
                'No data',
                style: Theme.of(context).textTheme.labelLarge,
              ),
            );
          }
          return ListView.builder(
            itemBuilder: (context, index) =>
                NewsItem(news: state.articles[index]),
            itemCount: state.articles.length,
          );
        }
        return const SizedBox();
      },
    );
  }
}
