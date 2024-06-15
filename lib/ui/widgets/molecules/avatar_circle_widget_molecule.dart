import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:portfolio/ui/ui.dart' show BuildContextExtension;
import 'package:portfolio/ui/ui.dart' show CircledIconWidgetAtom, IconType, IconsWidgetAtom;

class AvatarCircleWidgetMolecule extends StatelessWidget {
  const AvatarCircleWidgetMolecule({
    required IconType iconType,
    super.key,
  }) : _iconType = iconType;

  final IconType _iconType;

  @override
  Widget build(BuildContext context) {
    return CircledIconWidgetAtom(
      child: IconsWidgetAtom(
        iconType: _iconType,
        color: context.colorScheme.primary,
      ),
    );
  }
}
