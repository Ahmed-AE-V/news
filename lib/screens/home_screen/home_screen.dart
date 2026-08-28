import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/constants/app_assets.dart';
import 'package:news/models/category_model.dart';
import 'package:news/providers/theme_provider.dart';
import 'package:news/widgets/app_drawer.dart';
import 'package:news/widgets/category_card.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CategoryModel? selectedCategory;
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
      appBar: AppBar(
        title: Text(
          selectedCategory == null ? "Home" : selectedCategory!.name,
          style: GoogleFonts.inter(fontSize: 20, fontWeight: .w500),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(AppAssets.searchIc),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          spacing: 16,
          crossAxisAlignment: .start,
          children: [
            Text(
              "Good Morning\nHere is Some News For You",
              style: GoogleFonts.inter(
                fontSize: 24,
                fontWeight: .w500,
                color: theme.primaryColor,
              ),
            ),
            Expanded(
              child: ListView.separated(
                itemBuilder: (BuildContext context, int index) => CategoryCard(
                  category: categories[index],
                  index: index,
                  onTap: () {
                    setState(() {
                      selectedCategory = categories[index];
                    });
                  },
                ),
                separatorBuilder: (BuildContext context, int index) => Gap(16),
                itemCount: categories.length,
                shrinkWrap: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
