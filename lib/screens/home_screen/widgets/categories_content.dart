import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/models/category_model.dart';
import 'package:news/screens/home_screen/widgets/category_card.dart';

class CategoriesContent extends StatelessWidget {
  const CategoriesContent({
    super.key,
    required this.theme,
    required this.categories,
    required this.onCategoryClicked,
  });
  final void Function(CategoryModel category) onCategoryClicked;
  final ThemeData theme;
  final List<CategoryModel> categories;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                onTap: () => onCategoryClicked(categories[index]),
              ),
              separatorBuilder: (BuildContext context, int index) => Gap(16),
              itemCount: categories.length,
              shrinkWrap: true,
            ),
          ),
        ],
      ),
    );
  }
}
