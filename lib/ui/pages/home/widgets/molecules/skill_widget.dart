import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/common/common.dart';
import 'package:portfolio/ui/pages/home/widgets/atoms/atoms.dart';
import 'package:portfolio/ui/ui.dart';

class SkillData {
  const SkillData({
    required this.name,
    required this.color,
    required this.imageUrl,
    required this.startWork,
    this.showLogo = true,
    this.showTitle = true,
  });

  final String name;
  final String color;
  final String imageUrl;
  final String startWork;
  final bool showLogo;
  final bool showTitle;

  factory SkillData.fromJson(Map<String, dynamic> json) {
    return SkillData(
      name: json['name'] as String,
      color: json['color'] as String? ?? '',
      imageUrl: json['logo'] as String? ?? '',
      startWork: json['start_work'] as String? ?? '',
      showTitle: bool.tryParse(json['show_title']?.toString().trim() ?? '') ?? true,
      showLogo: bool.tryParse(json['show_logo']?.toString().trim() ?? '') ?? true,
    );
  }
}

// ignore: must_be_immutable
class SkillWidget extends StatelessWidget {
  SkillWidget(
    SkillData data, {
    super.key,
  }) : _data = data;

  final SkillData _data;

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
