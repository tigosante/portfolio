import 'package:flutter/widgets.dart';
import 'package:portfolio/extensions/extensions.dart';

class SectionWidget extends StatelessWidget {
  const SectionWidget({required Widget child, super.key}) : _child = child;

  final Widget _child;

  @override
  Widget build(BuildContext context) {
    final sectionHight = context.appSize.height * (context.appType.isDesktop ? 0.8 : 0.5);
    return Container(
      constraints: BoxConstraints(minHeight: sectionHight),
      child: _child,
    );
  }
}
