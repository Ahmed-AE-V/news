import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/constants/app_assets.dart';
import 'package:news/constants/app_colors.dart';
import 'package:news/screens/search_screen/search_screen.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const CustomAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AppBar(
      title: Text(
        title,
        style: GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.w500),
      ),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const SearchScreen()),
            );
          },
          icon: SvgPicture.asset(
            AppAssets.searchIc,
            colorFilter: ColorFilter.mode(theme.primaryColor, .srcIn),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(40);
}
