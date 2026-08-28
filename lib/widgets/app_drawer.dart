import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/constants/app_colors.dart';
import 'package:news/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class AppDrawer extends StatefulWidget {
  final VoidCallback onGoToHome;
  const AppDrawer({super.key, required this.onGoToHome});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  String selectedLanguage = 'English';

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();

    return Drawer(
      backgroundColor: AppColors.black,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            color: AppColors.white,
            padding: const EdgeInsets.symmetric(vertical: 60),
            child: Text(
              "News App",
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                fontSize: 28,
                fontWeight: FontWeight.w700,
                color: AppColors.black,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                    widget.onGoToHome();
                  },
                  child: Row(
                    children: [
                      const Icon(Icons.home_outlined, color: AppColors.white),
                      const SizedBox(width: 12),
                      Text(
                        "Go To Home",
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                          color: AppColors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                const Divider(color: AppColors.white),
                const SizedBox(height: 20),
                Row(
                  children: [
                    const Icon(
                      Icons.format_paint_outlined,
                      color: AppColors.white,
                    ),
                    const SizedBox(width: 12),
                    Text(
                      "Theme",
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                _DrawerDropdown<ThemeMode>(
                  value: themeProvider.themeMode,
                  items: const {
                    ThemeMode.light: "Light",
                    ThemeMode.dark: "Dark",
                    ThemeMode.system: "System",
                  },
                  onChanged: (mode) {
                    if (mode != null) themeProvider.setThemeMode(mode);
                  },
                ),
                const SizedBox(height: 20),
                const Divider(color: AppColors.white),
                const SizedBox(height: 20),
                Row(
                  children: [
                    const Icon(Icons.public_outlined, color: AppColors.white),
                    const SizedBox(width: 12),
                    Text(
                      "Language",
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                _DrawerDropdown<String>(
                  value: selectedLanguage,
                  items: const {'English': 'English', 'Arabic': 'Arabic'},
                  onChanged: (value) {
                    if (value != null) {
                      setState(() => selectedLanguage = value);
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _DrawerDropdown<T> extends StatelessWidget {
  final T value;
  final Map<T, String> items;
  final void Function(T?) onChanged;

  const _DrawerDropdown({
    required this.value,
    required this.items,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: AppColors.white),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<T>(
          value: value,
          isExpanded: true,
          icon: const Icon(Icons.arrow_drop_down, color: AppColors.white),
          items: items.entries
              .map(
                (e) => DropdownMenuItem<T>(
                  value: e.key,
                  child: Text(
                    e.value,
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      color: AppColors.white,
                    ),
                  ),
                ),
              )
              .toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
