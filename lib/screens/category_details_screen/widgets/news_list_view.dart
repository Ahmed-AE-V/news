// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:news/models/news_source_response.dart';
import 'package:news/screens/category_details_screen/widgets/news_item.dart';

class NewsListView extends StatelessWidget {
  final List<SourceModel> sources;
  const NewsListView({super.key, required this.sources});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.separated(
      itemBuilder: (context, index) => NewsItem(),
      separatorBuilder: (context, index) => Gap(16),
      itemCount: sources.length,
    );
  }
}
