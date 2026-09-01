import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/core/dio_client.dart';
import 'package:news/core/news_api_services.dart';
import 'package:news/models/article_model.dart';
import 'package:news/screens/home_screen/widgets/news_item.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final NewsApiServices newsApiServices = NewsApiServices(DioClient.instance);
  final TextEditingController controller = TextEditingController();
  Timer? _debounce;

  List<ArticleModel> articles = [];
  bool isLoading = true;
  String? error;

  @override
  void initState() {
    super.initState();
    _loadDefault();
  }

  @override
  void dispose() {
    _debounce?.cancel();
    controller.dispose();
    super.dispose();
  }

  Future<void> _loadDefault() async {
    setState(() {
      isLoading = true;
      error = null;
    });
    try {
      final result = await newsApiServices.getTopHeadlines();
      if (!mounted) return;
      setState(() {
        articles = result;
        isLoading = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        error = "$e";
        isLoading = false;
      });
    }
  }

  Future<void> _search(String query) async {
    setState(() {
      isLoading = true;
      error = null;
    });
    try {
      final result = await newsApiServices.searchArticles(query);
      if (!mounted) return;
      setState(() {
        articles = result;
        isLoading = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        error = "$e";
        isLoading = false;
      });
    }
  }

  void _onChanged(String value) {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      final query = value.trim();
      if (query.isEmpty) {
        _loadDefault();
      } else {
        _search(query);
      }
    });
  }

  void _clear() {
    _debounce?.cancel();
    controller.clear();
    _loadDefault();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Search",
          style: GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.w500),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: theme.dividerColor),
              ),
              child: Row(
                children: [
                  Icon(Icons.search, color: theme.iconTheme.color),
                  const Gap(8),
                  Expanded(
                    child: TextField(
                      controller: controller,
                      onChanged: _onChanged,
                      style: GoogleFonts.inter(fontSize: 16),
                      decoration: InputDecoration(
                        hintText: "Search",
                        hintStyle: GoogleFonts.inter(fontSize: 16),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  if (controller.text.isNotEmpty)
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: _clear,
                    ),
                ],
              ),
            ),
            const Gap(16),
            Expanded(child: _buildBody()),
          ],
        ),
      ),
    );
  }

  Widget _buildBody() {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator.adaptive());
    }
    if (error != null) {
      return Center(child: Text(error!));
    }
    if (articles.isEmpty) {
      return const Center(child: Text("No results found."));
    }
    return ListView.separated(
      itemBuilder: (context, index) => NewsItem(article: articles[index]),
      separatorBuilder: (context, index) => const Gap(16),
      itemCount: articles.length,
    );
  }
}
