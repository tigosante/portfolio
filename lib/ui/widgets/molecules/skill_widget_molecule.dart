import 'package:flutter/material.dart';
import 'package:portfolio/common/common.dart' show StringExtension;
import 'package:portfolio/domain/domain.dart' show SkillEntity;
import 'package:portfolio/ui/ui.dart';

// ignore: must_be_immutable
class SkillWidgetMolecule extends StatefulWidget {
  const SkillWidgetMolecule(
    SkillEntity data, {
    super.key,
  }) : _data = data;

  final SkillEntity _data;

  @override
  State<SkillWidgetMolecule> createState() => _SkillWidgetMoleculeState();
}

class _SkillWidgetMoleculeState extends State<SkillWidgetMolecule> {
  bool _showHover = false;

  @override
  Widget build(BuildContext context) {
    const duration = Duration(milliseconds: 200);
    final backgroundColor = context.colorScheme.tertiary;
    final textColor = _showHover ? widget._data.color.toColor() : context.colorScheme.primary;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _showHover = true),
      onExit: (_) => setState(() => _showHover = false),
      child: AnimatedContainer(
        duration: duration,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(context.measuries.borderRadiusMedium),
          boxShadow: [
            if (_showHover)
              BoxShadow(
                blurRadius: 1,
                spreadRadius: 0.1,
                color: context.colorScheme.primary.withOpacity(0.05),
              ),
          ],
        ),
        child: AnimatedContainer(
          duration: duration,
          padding: EdgeInsets.all(context.measuries.paddingSmall / 1.5)
              .add(EdgeInsets.symmetric(horizontal: context.measuries.paddingSmall / 4)),
          decoration: BoxDecoration(
            color: _showHover ? widget._data.color.toColor().withOpacity(0.05) : null,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedDefaultTextStyle(
                maxLines: 1,
                duration: duration,
                textAlign: TextAlign.left,
                style: context.textTheme.bodyMedium.copyWith(color: textColor, fontWeight: FontWeight.bold),
                child: Text(widget._data.name),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: context.measuries.paddingSmall / 4),
                child: AnimatedDefaultTextStyle(
                  maxLines: 1,
                  duration: duration,
                  textAlign: TextAlign.left,
                  style: context.textTheme.labelSmall.copyWith(color: textColor),
                  child: const Text('•'),
                ),
              ),
              AnimatedDefaultTextStyle(
                maxLines: 1,
                duration: duration,
                textAlign: TextAlign.left,
                style: context.textTheme.bodySmall.copyWith(color: textColor, fontWeight: FontWeight.w500),
                child: Text(widget._data.startWork),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
