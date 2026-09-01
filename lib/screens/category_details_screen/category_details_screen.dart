import 'package:flutter/material.dart';
import 'package:news/core/dio_client.dart';
import 'package:news/core/news_api_services.dart';
import 'package:news/models/category_model.dart';

class CategoryDetailsScreen extends StatefulWidget {
  final CategoryModel category;
  const CategoryDetailsScreen({super.key, required this.category});

  @override
  State<CategoryDetailsScreen> createState() => _CategoryDetailsScreenState();
}

class _CategoryDetailsScreenState extends State<CategoryDetailsScreen> {
  final NewsApiServices newsApiServices = NewsApiServices(DioClient.instance);
  @override
  void initState() {
    super.initState();
    newsApiServices.getSources(widget.category.name);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: newsApiServices.getSources(widget.category.name),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator.adaptive());
        }
        if (snapshot.hasError) {
          return Text("${snapshot.error}");
        } else {
          final sources = snapshot.data!;
          return DefaultTabController(
            length: sources.length,
            child: Scaffold(appBar: AppBar()),
          );
        }
      },
    );
  }
}
