import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/constants/app_assets.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const CustomAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: GoogleFonts.inter(fontSize: 20, fontWeight: .w500),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(AppAssets.searchIc),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(40);
}
