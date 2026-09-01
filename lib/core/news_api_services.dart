// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:news/models/article_model.dart';
import 'package:news/models/news_source_response.dart';

class NewsApiServices {
  final Dio dio;
  NewsApiServices(this.dio);

  Future<List<SourceModel>> getSources(String category) async {
    final response = await dio.get(
      "https://newsapi.org/v2/top-headlines/sources",
      queryParameters: {
        "apiKey": "f0eae869c15d47589aca546bd262b432",
        // NewsAPI only accepts lowercase category values
        // (business, entertainment, general, health, science, sports, technology)
        "category": category.toLowerCase(),
      },
    );
    final newsSourcesResponse = NewsSourcesResponse.fromJson(response.data);
    return newsSourcesResponse.sources;
  }

  Future<List<ArticleModel>> getArticles(String sourceId) async {
    final response = await dio.get(
      "https://newsapi.org/v2/top-headlines",
      queryParameters: {
        "apiKey": "f0eae869c15d47589aca546bd262b432",
        "sources": sourceId,
      },
    );
    final articlesResponse = ArticlesResponse.fromJson(response.data);
    return articlesResponse.articles;
  }
}
