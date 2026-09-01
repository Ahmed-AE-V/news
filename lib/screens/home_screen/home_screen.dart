import 'package:flutter/material.dart';
import 'package:news/constants/app_assets.dart';
import 'package:news/models/category_model.dart';
import 'package:news/providers/theme_provider.dart';
import 'package:news/screens/home_screen/widgets/category_details_screen.dart';
import 'package:news/screens/home_screen/widgets/categories_content.dart';
import 'package:news/widgets/app_drawer.dart';
import 'package:news/widgets/custom_app_bar.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CategoryModel? selectedCategory;

  void onCategoryClicked(CategoryModel category) {
    setState(() {
      selectedCategory = category;
    });
  }

  @override
  @override
  Widget build(BuildContext context) {
    bool isDark = context.watch<ThemeProvider>().isDarkMode;
    final theme = Theme.of(context);
    List<CategoryModel> categories = [
      CategoryModel(
        image: isDark ? AppAssets.generalImg : AppAssets.generalDarkImg,
        name: 'General',
      ),
      CategoryModel(
        image: isDark ? AppAssets.businessImg : AppAssets.businessDarkImg,
        name: 'Business',
      ),
      CategoryModel(
        image: isDark ? AppAssets.sportsImg : AppAssets.sportsDarkImg,
        name: 'Sports',
      ),
      CategoryModel(
        image: isDark ? AppAssets.technologyImg : AppAssets.technologyDarkImg,
        name: 'Technology',
      ),
      CategoryModel(
        image: isDark
            ? AppAssets.entertainmentImg
            : AppAssets.entertainmentDarkImg,
        name: 'Entertainment',
      ),
      CategoryModel(
        image: isDark ? AppAssets.healthImg : AppAssets.healthDarkImg,
        name: 'Health',
      ),
      CategoryModel(
        image: isDark ? AppAssets.scienceImg : AppAssets.scienceDarkImg,
        name: 'Science',
      ),
    ];
    return Scaffold(
      drawer: AppDrawer(
        onGoToHome: () {
          setState(() {
            selectedCategory = null;
          });
        },
      ),
      appBar: CustomAppBar(
        title: selectedCategory == null ? "Home" : selectedCategory!.name,
      ),
      body: selectedCategory == null
          ? CategoriesContent(
              theme: theme,
              categories: categories,
              onCategoryClicked: onCategoryClicked,
            )
          : CategoryDetails(category: selectedCategory!),
    );
  }
}
