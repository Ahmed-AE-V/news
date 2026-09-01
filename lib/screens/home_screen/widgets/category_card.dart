import 'package:flutter/material.dart';
import 'package:news/models/category_model.dart';
import 'package:news/screens/home_screen/widgets/view_all_button.dart';

class CategoryCard extends StatelessWidget {
  final CategoryModel category;
  final VoidCallback onTap;
  final int index;

  const CategoryCard({
    super.key,
    required this.category,
    required this.index,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    bool isEven = index % 2 == 0;
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadiusGeometry.circular(24),
          child: Image.asset(category.image),
        ),
        Positioned(
          right: isEven ? 16 : null,
          left: isEven ? null : 16,
          bottom: 16,
          child: ViewAllButton(isEven: isEven, onTap: onTap),
        ),
      ],
    );
  }
}
