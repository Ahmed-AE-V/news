import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/models/category_model.dart';

class CategoryCard extends StatelessWidget {
  final CategoryModel category;
  final void Function()? onTap;
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

class ViewAllButton extends StatelessWidget {
  final bool isEven;
  final void Function()? onTap;
  const ViewAllButton({super.key, required this.isEven, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ElevatedButton(
      onPressed: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width * .43,
        padding: EdgeInsets.zero,

        decoration: BoxDecoration(borderRadius: BorderRadius.circular(84)),
        child: Row(
          textDirection: isEven ? TextDirection.ltr : TextDirection.rtl,
          children: [
            Spacer(),
            Text(
              "View All",
              style: GoogleFonts.inter(fontSize: 24, fontWeight: .w500),
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.zero,
              child: CircleAvatar(
                backgroundColor: theme.scaffoldBackgroundColor,
                foregroundColor: theme.primaryColor,
                radius: 30,
                child: Icon(
                  isEven
                      ? Icons.arrow_forward_ios_rounded
                      : Icons.arrow_back_ios_rounded,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
