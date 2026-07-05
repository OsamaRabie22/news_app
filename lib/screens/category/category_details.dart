import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/cubits/news/news_cubit.dart';
import 'package:news/cubits/sources/sources_cubit.dart';
import 'package:news/cubits/sources/sources_state.dart';
import 'package:news/utils/app_colors.dart';
import 'package:news/widget/main_error_widget.dart';
import 'package:news/widget/main_loading_widget.dart';
import 'package:news/widget/news_widget.dart';

class CategoryDetails extends StatelessWidget {
  static const String routeName = 'CategoryDetails';
  final String
  categoryId; //sports,general ✅ هنستقبل id بتاع الـ category المختارة
  CategoryDetails({super.key, required this.categoryId});

  @override
  Widget build(BuildContext context) {
    // return FutureBuilder<SourceResponse>(
    //   future: ApiManager.getSources(),
    //   builder: (context, snapshot) {
    //     if (snapshot.connectionState == ConnectionState.waiting) {
    //       return Center(child: MainLodingWidget());
    //     } else if (snapshot.hasError) {
    //       return Center(
    //         child: MainErrorWidget(
    //           errorMessage: 'Something went wrong',
    //           onPressed: () {
    //             ApiManager.getSources();
    //             setState(() {});
    //           },
    //         ),
    //       );
    //     }
    //     if (snapshot.data?.status != 'ok') {
    //       return Center(
    //         child: MainErrorWidget(
    //           errorMessage: snapshot.data!.message!,
    //           onPressed: () {
    //             ApiManager.getSources(widget.);
    //             setState(() {});
    //           },
    //         ),
    //       );
    //     } else {
    //       var sourcesList = snapshot.data?.sources ?? [];
    return BlocProvider<SourcesCubit>(
      create: (context) => SourcesCubit()..getSources(categoryId),
      child: BlocBuilder<SourcesCubit, SourcesState>(
        builder: (context, state) {
          if (state is SourcesLoading) {
            return Center(child: MainLoadingWidget());
          } else if (state is SourcesError) {
            return Center(
              child: MainErrorWidget(
                errorMessage: state.message,
                onPressed: () {
                  context.read<SourcesCubit>().getSources(categoryId);
                },
              ),
            );
          } else if (state is SourcesSuccess) {
            var cubit = context.read<SourcesCubit>();
            return Column(
              children: [
                DefaultTabController(
                  length: state.sources.length,
                  initialIndex: cubit.selectedIndex,
                  child: TabBar(
                    onTap: (value) {
                      cubit.changeSource(value);
                    },
                    indicatorColor: Theme.of(context).splashColor,
                    labelStyle: Theme.of(context).textTheme.bodySmall,
                    unselectedLabelStyle: Theme.of(
                      context,
                    ).textTheme.labelMedium,
                    dividerColor: AppColors.transparentColor,
                    tabAlignment: TabAlignment.start,
                    isScrollable: true,
                    tabs: state.sources
                        .map((e) => Tab(child: Text(e.name ?? '')))
                        .toList(),
                  ),
                ),
                Expanded(
                  child: BlocProvider(
                    key: ValueKey(cubit.selectedIndex),
                    create: (context) => NewsCubit()
                      ..getNews(state.sources[cubit.selectedIndex].id ?? ''),
                    child: NewsWidget(
                      sourceId: state.sources[cubit.selectedIndex].id ?? '',
                    ),
                  ),
                ),
              ],
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
