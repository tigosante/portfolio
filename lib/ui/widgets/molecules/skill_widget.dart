import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/common/common.dart'
    show BrightnessExtension, BuildContextExtension, ColorSchemeExtension, StringExtension;
import 'package:portfolio/domain/domain.dart' show SkillEntity;
import 'package:portfolio/ui/ui.dart' show CircledIconWidget, TextWidget;

// ignore: must_be_immutable
class SkillWidget extends StatefulWidget {
  const SkillWidget(
    SkillEntity data, {
    super.key,
  }) : _data = data;

  final SkillEntity _data;

  @override
  State<SkillWidget> createState() => _SkillWidgetState();
}

class _SkillWidgetState extends State<SkillWidget> {
  bool _showHover = false;

  @override
  Widget build(BuildContext context) {
    final isLightTheme = context.colorScheme.brightness.isLight;
    final circleLogoColor = isLightTheme ? context.colorScheme.surface : context.colorScheme.secondary.withOpacity(0.2);
    var backgroundColor = context.colorScheme.primary.withOpacity(0.05);

    if (_showHover) {
      backgroundColor = widget._data.color.toColor().withOpacity(isLightTheme ? 0.05 : 0.2);
    } else if (!isLightTheme) {
      context.colorScheme.primary.withOpacity(0.02);
    }

    return MouseRegion(
      onEnter: (_) => setState(() => _showHover = true),
      onExit: (_) => setState(() => _showHover = false),
      child: Container(
        padding: EdgeInsets.all(context.measuries.paddingSmall),
        constraints: const BoxConstraints(minHeight: 60, minWidth: 60),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(context.measuries.borderRadiusMedium),
        ),
        child: !widget._data.showLogo
            ? _TextHoverWidget(data: widget._data, useSeparator: false)
            : Wrap(
                runAlignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                alignment: widget._data.showTitle ? WrapAlignment.spaceBetween : WrapAlignment.center,
                children: [
                  CircledIconWidget(
                    color: circleLogoColor,
                    borderColor: context.colorScheme.transparent,
                    padding: EdgeInsets.all(context.measuries.paddingSmall * 1.2),
                    child: SvgPicture.string(
                      widget._data.imageUrl,
                      semanticsLabel: widget._data.name,
                      placeholderBuilder: (_) => const CircularProgressIndicator(),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: context.measuries.paddingSmall / 2,
                      right: context.measuries.paddingSmall,
                    ),
                    child: _TextHoverWidget(data: widget._data, showTitle: widget._data.showTitle),
                  ),
                ],
              ),
      ),
    );
  }
}

class _TextHoverWidget extends StatelessWidget {
  const _TextHoverWidget({
    required SkillEntity data,
    bool showTitle = true,
    bool useSeparator = true,
  })  : _data = data,
        _showTitle = showTitle,
        _useSeparator = useSeparator;

  final bool _showTitle;
  final bool _useSeparator;
  final SkillEntity _data;
  @override
  Widget build(BuildContext context) {
    final textColor = context.colorScheme.primary;
    final subTitle = TextWidget(
      _data.startWork,
      style: context.textTheme.bodySmall.copyWith(color: textColor, fontWeight: FontWeight.w500),
    );

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (_useSeparator) ...[
          TextWidget('•', style: context.textTheme.bodySmall.copyWith(color: textColor)),
          SizedBox(width: context.measuries.paddingSmall),
        ],
        if (_showTitle)
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: _useSeparator ? CrossAxisAlignment.start : CrossAxisAlignment.center,
            children: [
              TextWidget(
                _data.name,
                style: context.textTheme.bodyMedium.copyWith(color: textColor, fontWeight: FontWeight.bold),
              ),
              subTitle,
            ],
          )
        else
          subTitle,
      ],
    );
  }
}
