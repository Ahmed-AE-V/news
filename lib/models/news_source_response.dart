class NewsSourcesResponse {
  final String status;
  final List<SourceModel> sources;

  NewsSourcesResponse({required this.status, required this.sources});

  factory NewsSourcesResponse.fromJson(Map<String, dynamic> json) {
    return NewsSourcesResponse(
      status: json['status'] as String,
      sources: (json['sources'] as List)
          .map((e) => SourceModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class SourceModel {
  final String id;
  final String name;
  final String description;
  final String url;
  final String category;
  final String language;
  final String country;

  SourceModel({
    required this.id,
    required this.name,
    required this.description,
    required this.url,
    required this.category,
    required this.language,
    required this.country,
  });

  factory SourceModel.fromJson(Map<String, dynamic> json) {
    return SourceModel(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      url: json['url'] as String,
      category: json['category'] as String,
      language: json['language'] as String,
      country: json['country'] as String,
    );
  }
}
