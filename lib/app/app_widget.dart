import 'package:flutter/material.dart';
import 'package:portfolio/ui/theme/colors/app_colors_impl.dart';
import 'package:portfolio/ui/theme/measuries/app_measuries_impl.dart';
import 'package:portfolio/ui/ui.dart' show AppTheme;

class AppWidget extends StatefulWidget {
  const AppWidget({
    required RouterDelegate<Object>? routerDelegate,
    required RouteInformationParser<Object>? routeInformationParser,
    super.key,
  })  : _routerDelegate = routerDelegate,
        _routeInformationParser = routeInformationParser;

  final RouterDelegate<Object>? _routerDelegate;
  final RouteInformationParser<Object>? _routeInformationParser;

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  Widget build(BuildContext context) {
    final theme = AppTheme(colors: AppColorsImpl(), measuries: AppMeasuriesImpl());
    return MaterialApp.router(
      title: 'Portfolio',
      theme: theme.light(),
      // TODO: remover
      darkTheme: theme.dark(),
      debugShowCheckedModeBanner: false,
      routerDelegate: widget._routerDelegate,
      routeInformationParser: widget._routeInformationParser,
      scrollBehavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
    );
  }
}
