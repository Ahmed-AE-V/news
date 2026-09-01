import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:news/core/dio_client.dart';
import 'package:news/core/news_api_services.dart';
import 'package:news/models/article_model.dart';
import 'package:news/screens/category_details_screen/widgets/news_item.dart';

class NewsListView extends StatefulWidget {
  final String sourceId;
  const NewsListView({super.key, required this.sourceId});

  @override
  State<NewsListView> createState() => _NewsListViewState();
}

class _NewsListViewState extends State<NewsListView>
    with AutomaticKeepAliveClientMixin {
  final NewsApiServices newsApiServices = NewsApiServices(DioClient.instance);
  late final Future<List<ArticleModel>> articlesFuture;

  @override
  void initState() {
    super.initState();
    articlesFuture = newsApiServices.getArticles(widget.sourceId);
  }

  // Keeps this tab's fetched articles alive when switching tabs,
  // instead of re-fetching every time you swipe back to it.
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return FutureBuilder<List<ArticleModel>>(
      future: articlesFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator.adaptive());
        }
        if (snapshot.hasError) {
          return Center(child: Text("${snapshot.error}"));
        }

        final articles = snapshot.data!;
        if (articles.isEmpty) {
          return const Center(child: Text("No articles found."));
        }

        return ListView.separated(
          padding: const EdgeInsets.all(16),
          itemBuilder: (context, index) => NewsItem(article: articles[index]),
          separatorBuilder: (context, index) => const Gap(16),
          itemCount: articles.length,
        );
      },
    );
  }
}
