import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/core/dio_client.dart';
import 'package:news/core/news_api_services.dart';
import 'package:news/models/category_model.dart';
import 'package:news/models/news_source_response.dart';
import 'package:news/screens/home_screen/widgets/news_list_view.dart';

class CategoryDetails extends StatefulWidget {
  final CategoryModel category;
  const CategoryDetails({super.key, required this.category});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsScreenState();
}

class _CategoryDetailsScreenState extends State<CategoryDetails> {
  final NewsApiServices newsApiServices = NewsApiServices(DioClient.instance);
  late final Future<List<SourceModel>> sourcesFuture;

  @override
  void initState() {
    super.initState();
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
                labelStyle: GoogleFonts.inter(fontWeight: .w700, fontSize: 16),
                unselectedLabelStyle: GoogleFonts.inter(
                  fontWeight: .w500,
                  fontSize: 14,
                ),
                dividerHeight: 0,
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
