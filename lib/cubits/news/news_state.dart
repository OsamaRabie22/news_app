import 'package:news/models/news_response.dart';

abstract class NewsState {}

class NewsLoading extends NewsState {}

class NewsError extends NewsState {
  final String message;

  NewsError(this.message);
}

class NewsSuccess extends NewsState {
  final List<Articles> articles;

  NewsSuccess(this.articles);
}
