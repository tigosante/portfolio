import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:portfolio/common/common.dart' show BuildContextExtension;
import 'package:portfolio/ui/ui.dart' show CircledIconWidget, IconType, IconsWidget;

class AvatarCircleWidget extends StatelessWidget {
  const AvatarCircleWidget({
    required IconType iconType,
    super.key,
  }) : _iconType = iconType;

  final IconType _iconType;

  @override
  Widget build(BuildContext context) {
    return CircledIconWidget(
      child: IconsWidget(
        iconType: _iconType,
        color: context.colors.primary,
      ),
    );
  }
}
