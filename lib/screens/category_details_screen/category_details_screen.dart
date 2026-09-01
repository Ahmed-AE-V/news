import 'package:flutter/material.dart';
import 'package:news/core/dio_client.dart';
import 'package:news/core/news_api_services.dart';
import 'package:news/models/category_model.dart';
import 'package:news/models/news_source_response.dart';
import 'package:news/screens/category_details_screen/widgets/news_list_view.dart';

class CategoryDetailsScreen extends StatefulWidget {
  final CategoryModel category;
  const CategoryDetailsScreen({super.key, required this.category});

  @override
  State<CategoryDetailsScreen> createState() => _CategoryDetailsScreenState();
}

class _CategoryDetailsScreenState extends State<CategoryDetailsScreen> {
  final NewsApiServices newsApiServices = NewsApiServices(DioClient.instance);
  late final Future<List<SourceModel>> sourcesFuture;

  @override
  void initState() {
    super.initState();
    // Fetch once here only — build() just reads this same future,
    // instead of starting a brand new request on every rebuild.
    sourcesFuture = newsApiServices.getSources(widget.category.name);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<SourceModel>>(
      future: sourcesFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator.adaptive());
        }
        if (snapshot.hasError) {
          return Center(child: Text("${snapshot.error}"));
        }

        final sources = snapshot.data!;
        if (sources.isEmpty) {
          return const Center(child: Text("No sources found."));
        }

        return DefaultTabController(
          length: sources.length,
          child: Column(
            children: [
              TabBar(
                isScrollable: true,
                tabAlignment: TabAlignment.start,
                tabs: sources.map((source) => Tab(text: source.name)).toList(),
              ),
              Expanded(
                child: TabBarView(
                  children: sources
                      .map((source) => NewsListView(sourceId: source.id))
                      .toList(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
