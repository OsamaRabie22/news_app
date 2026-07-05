import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/api/api_constants.dart';
import 'package:news/api/end_points.dart';
import 'package:news/models/news_response.dart';
import 'package:news/models/source_response.dart';

class ApiManager {
  static Future<SourceResponse> getSources(String category) async {
    Uri url = Uri.https(ApiConstants.baseUrl, EndPoints.sourceApi, {
      'apiKey': ApiConstants.apiKey,
      'category': category,
    });
    try {
      var response = await http.get(url);
      if (response.statusCode != 200) {
        throw Exception('Server error: ${response.statusCode}');
      }
      var responseBody = SourceResponse.fromJson(jsonDecode(response.body));
      if (responseBody.status != 'ok') {
        throw Exception(responseBody.message ?? 'API error');
      }
      return responseBody;
    } catch (e) {
      rethrow;
    }
  }

  // https://newsapi.org/v2/everything?apiKey=45ad05d1a7864d2b85b95571d090ad6&q=abc-news
  static Future<NewsResponse> getNewsById(String sourceId) async {
    Uri url = Uri.https(ApiConstants.baseUrl, EndPoints.newsApi, {
      'apiKey': ApiConstants.apiKey,
      'sources': sourceId,
    });
    try {
      var response = await http.get(url);
      if (response.statusCode != 200) {
        throw Exception('Server error: ${response.statusCode}');
      }
      var responseBody = NewsResponse.fromJson(jsonDecode(response.body));
      if (responseBody.status != 'ok') {
        throw Exception(responseBody.message ?? 'API error');
      }
      return responseBody;
    } catch (e) {
      rethrow;
    }
  }
}
