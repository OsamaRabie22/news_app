import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news/models/news_response.dart';
import 'package:news/utils/app_colors.dart';
import 'package:news/widget/main_loading_widget.dart';
import 'package:timeago/timeago.dart' as timeago;

class NewsItem extends StatelessWidget {
  final Articles news;

  const NewsItem({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.all(width * 0.04),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Theme.of(context).splashColor, width: 2),
          color: AppColors.transparentColor,
        ),
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.all(width * 0.02),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(16),
                child: news.urlToImage != null && news.urlToImage!.isNotEmpty
                    ? CachedNetworkImage(
                        imageUrl: news.urlToImage!,
                        height: 220,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        placeholder: (context, url) => SizedBox(
                          height: 220,
                          child: Center(child: MainLoadingWidget()),
                        ),
                        errorWidget: (context, url, error) => Container(
                          height: 220,
                          width: double.infinity,
                          color: Colors.grey,
                          child: Icon(Icons.broken_image, size: 50),
                        ),
                      )
                    // ✅ لو الصورة مفيش أصلاً
                    : Container(
                        height: 220,
                        color: Colors.grey,
                        child: Icon(Icons.broken_image, size: 50),
                      ),
              ),
              SizedBox(height: height * 0.01),
              Text(
                news.title ?? 'Unknown',
                style: Theme.of(context).textTheme.bodySmall,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: height * 0.01),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      'By :${news.author ?? 'Unknown'}',
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ),
                  Text(
                    formatTimeAgo(news.publishedAt),
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  String formatTimeAgo(String? date) {
    if (date == null || date.isEmpty) return '';

    try {
      final dateTime = DateTime.parse(date).toLocal();
      return timeago.format(dateTime);
    } catch (e) {
      return 'Unknown';
    }
  }
}
