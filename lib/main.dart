import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart' show GetIt;
import 'package:portfolio/application.dart';
import 'package:portfolio/common/injector/app_injector_impl.dart';
import 'package:portfolio/common/injector/injector_handler.dart';

final _getIt = GetIt.instance;
void main() {
  runApp(
    Application(
      router: injectorHandler(AppInjectorImpl(provider: _getIt)).get(),
    ),
  );
}
