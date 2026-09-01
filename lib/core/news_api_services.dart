// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:news/models/news_source_response.dart';

class NewsApiServices {
  final Dio dio;
  NewsApiServices(this.dio);
  Future<List<SourceModel>> getSources(String category) async {
    final response = await dio.get(
      "https://newsapi.org/v2/top-headlines/sources",
      queryParameters: {
        "apiKey": "f0eae869c15d47589aca546bd262b432",
        "category": category,
      },
    );
    final newsSourcesResponse = NewsSourcesResponse.fromJson(response.data);
    return newsSourcesResponse.sources;
  }
}
