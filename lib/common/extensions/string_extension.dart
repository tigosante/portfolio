import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

extension StringExtension on String {
  String captalize() => isNotEmpty ? '${this[0].toUpperCase()}${substring(1)}' : '';

  Color toColor() {
    final hexColor = replaceAll('#', '');
    return Color(int.parse('0xFF$hexColor'));
  }

  bool isEmail() => RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(trim());

  bool isURL() => RegExp(r'^(http|https):\/\/([\w.]+\/?)\S*$').hasMatch(trim());

  void launchLink() {
    late Uri uri;
    if (isEmail()) {
      uri = Uri.parse('mailto:${trim()}');
    } else if (isURL()) {
      uri = Uri.parse(trim());
    } else {
      return debugPrint('-> ${this}invalid URL!');
    }
    launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  String translate([List<String> binds = const []]) => this;
}
