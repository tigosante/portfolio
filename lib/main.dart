import 'package:flutter/material.dart';
import 'package:portfolio/extensions/extensions.dart' show BuildContextExtension;
import 'package:portfolio/ui/ui.dart' show AppColors, AppTheme, HomePage;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme(appType: context.appType);
    return MaterialApp(
      title: 'Flutter Demo',
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
      theme: theme.light(AppColors.light()),
      darkTheme: theme.dark(AppColors.dark()),
      scrollBehavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
    );
  }
}
