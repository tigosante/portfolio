import 'package:flutter/material.dart';
import 'package:portfolio/common/common.dart' show AppRouter;
import 'package:portfolio/ui/ui.dart' show AppColors, AppMeasuries, AppTheme;

class Application extends StatelessWidget {
  const Application({
    required AppRouter router,
    super.key,
  }) : _router = router;

  final AppRouter _router;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme(colors: AppColors(), measuries: AppMeasuries());
    return MaterialApp.router(
      title: 'Portfolio',
      theme: theme.light(),
      darkTheme: theme.dark(),
      debugShowCheckedModeBanner: false,
      routerConfig: _router.routerConfig,
      scrollBehavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
    );
  }
}
