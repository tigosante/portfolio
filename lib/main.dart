import 'package:flutter/foundation.dart' show kDebugMode;
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
    final theme = AppTheme(appColors: AppColors(), appType: context.appType);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: theme.light,
      darkTheme: theme.dark,
      debugShowCheckedModeBanner: kDebugMode,
      home: const HomePage(),
    );
  }
}
