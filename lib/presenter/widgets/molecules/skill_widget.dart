import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/common/common.dart' show BuildContextExtension, StringExtension;
import 'package:portfolio/domain/domain.dart' show SkillEntity;
import 'package:portfolio/presenter/presenter.dart' show AppColors, CircledIconWidget, TextWidget;

// ignore: must_be_immutable
class SkillWidget extends StatelessWidget {
  SkillWidget(
    SkillEntity data, {
    super.key,
  }) : _data = data;

  final SkillEntity _data;

  bool _showHover = false;
  void Function(void Function())? _hoverState;

  @override
  Widget build(BuildContext context) {
    final isLightTheme = context.brightness == Brightness.light;
    TextStyle titleStye() => context.textTheme.bodyMedium.copyWith(
          fontWeight: FontWeight.bold,
          color: isLightTheme ? context.colors.primary : context.colors.onPrimary,
        );

    if (!_data.showLogo) {
      return _hoverWidget(
        colors: context.colors,
        isLightTheme: isLightTheme,
        content: Padding(
          padding: EdgeInsets.all(context.dimensions.paddingSmall * 1.5),
          child: TextWidget(_data.name, style: titleStye()),
        ),
      );
    }

    final content = Padding(
      padding: EdgeInsets.only(right: _data.showTitle ? context.dimensions.paddingSmall : 0),
      child: Wrap(
        runAlignment: WrapAlignment.center,
        alignment: WrapAlignment.spaceBetween,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          CircledIconWidget(
            borderColor: context.colors.transparent,
            padding: EdgeInsets.all(context.dimensions.paddingSmall),
            child: SvgPicture.string(
              _data.imageUrl,
              semanticsLabel: _data.name,
              placeholderBuilder: (_) => const CircularProgressIndicator(),
            ),
          ),
          if (_data.showTitle) TextWidget(_data.name, style: titleStye()),
        ],
      ),
    );

    return _hoverWidget(content: content, isLightTheme: isLightTheme, colors: context.colors);
  }

  Widget _hoverWidget({required Widget content, required AppColors colors, bool isLightTheme = true}) {
    final backgroundColor = isLightTheme ? null : colors.primary;

    return MouseRegion(
      onEnter: (_) => isLightTheme ? _hoverState?.call(() => _showHover = true) : null,
      onExit: (_) => isLightTheme ? _hoverState?.call(() => _showHover = false) : null,
      child: StatefulBuilder(
        builder: (context, state) {
          _hoverState = state;
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(context.dimensions.borderRadiusMedium),
              color:
                  backgroundColor ?? (_showHover ? _data.color.toColor().withOpacity(0.1) : context.colors.transparent),
            ),
            child: content,
          );
        },
      ),
    );
  }
}
