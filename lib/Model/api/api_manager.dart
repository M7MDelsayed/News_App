import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/Model/news/NewsResponse.dart';

import '../sources/SourceResponse.dart';

class ApiManager {
  static const String baseUrl = "newsapi.org";
  static const String apiKey = "1774169fdd594266a7b755baf53d6c98";

  static Future<SourceResponse> getSources(String categoryId) async {
    var url = Uri.https(baseUrl, '/v2/top-headlines/sources',
        {"apiKey": apiKey, "category": categoryId});
    var response = await http.get(url);
    return SourceResponse.fromJson(jsonDecode(response.body));
  }

  static Future<NewsResponse> getNews({String? sourceId, String? query}) async {
    var url = Uri.https(baseUrl, '/v2/everything', {
      "apiKey": apiKey,
      "sources": sourceId,
      "q": query,
    });
    var response = await http.get(url);
    return NewsResponse.fromJson(jsonDecode(response.body));
  }
}
