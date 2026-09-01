import 'package:flutter/material.dart';
import 'package:news/constants/app_theme.dart';
import 'package:news/providers/theme_provider.dart';
import 'package:news/routes/app_routes.dart';
import 'package:news/screens/home_screen/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ThemeProvider())],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeMode = context.watch<ThemeProvider>().themeMode;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News App',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeMode,
      home: HomeScreen(),
      routes: {AppRoutes.homeScreen: (context) => HomeScreen()},
    );
  }
}
