class ArticlesResponse {
  final String status;
  final int totalResults;
  final List<ArticleModel> articles;

  ArticlesResponse({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  factory ArticlesResponse.fromJson(Map<String, dynamic> json) {
    return ArticlesResponse(
      status: json['status'] as String,
      totalResults: json['totalResults'] as int,
      articles: (json['articles'] as List)
          .map((e) => ArticleModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class ArticleModel {
  final String? author;
  final String title;
  final String? description;
  final String url;
  final String? urlToImage;
  final DateTime? publishedAt;
  final String? content;

  ArticleModel({
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      author: json['author'] as String?,
      title: json['title'] as String? ?? '',
      description: json['description'] as String?,
      url: json['url'] as String? ?? '',
      urlToImage: json['urlToImage'] as String?,
      publishedAt: json['publishedAt'] != null
          ? DateTime.tryParse(json['publishedAt'] as String)
          : null,
      content: json['content'] as String?,
    );
  }
}
