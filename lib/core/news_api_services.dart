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

  // search screen defult articlesssssssssss
  Future<List<ArticleModel>> getTopHeadlines() async {
    final response = await dio.get(
      "https://newsapi.org/v2/top-headlines",
      queryParameters: {
        "apiKey": "f0eae869c15d47589aca546bd262b432",
        "country": "us",
      },
    );
    final articlesResponse = ArticlesResponse.fromJson(response.data);
    return articlesResponse.articles;
  }

  // search screen search by quary articlesssssssss
  Future<List<ArticleModel>> searchArticles(String query) async {
    final response = await dio.get(
      "https://newsapi.org/v2/everything",
      queryParameters: {
        "apiKey": "f0eae869c15d47589aca546bd262b432",
        "q": query,
        "sortBy": "publishedAt",
      },
    );
    final articlesResponse = ArticlesResponse.fromJson(response.data);
    return articlesResponse.articles;
  }
}
