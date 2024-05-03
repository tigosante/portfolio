import 'package:flutter/material.dart';
import 'package:portfolio/extensions/extensions.dart'
    show BuildContextExtension;
import 'package:portfolio/ui/ui.dart' show AppColors, AppTheme, HomePage;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme(
      appType: context.appType,
      appColorsDark: AppColors.dark(),
      appColorsLight: AppColors.light(),
    );
    return MaterialApp(
      title: 'Flutter Demo',
      theme: theme.light,
      darkTheme: theme.dark,
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
