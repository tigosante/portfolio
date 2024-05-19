import 'package:flutter/material.dart';
import 'package:portfolio/common/common.dart' show BuildContextExtension;
import 'package:portfolio/presenter/presenter.dart' show AppColors, AppRouter, AppTheme;

class Application extends StatelessWidget {
  const Application({
    required AppRouter router,
    super.key,
  }) : _router = router;

  final AppRouter _router;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme(appType: context.appType);
    return MaterialApp.router(
      title: 'Portfolio',
      debugShowCheckedModeBanner: false,
      routerConfig: _router.routerConfig,
      theme: theme.light(AppColors.light()),
      darkTheme: theme.dark(AppColors.dark()),
      scrollBehavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
    );
  }
}
