import 'package:flutter/material.dart';
import 'package:portfolio/extensions/extensions.dart';
import 'package:portfolio/ui/ui.dart' show AppTextTypeEnum;

class TextWidget extends StatelessWidget {
  const TextWidget(
    String data, {
    super.key,
    TextAlign textAlign = TextAlign.left,
    AppTextTypeEnum textType = AppTextTypeEnum.bodyMedium,
    TextStyle? style,
  })  : _data = data,
        _style = style,
        _textType = textType,
        _textAlign = textAlign;

  final String _data;
  final TextAlign _textAlign;
  final AppTextTypeEnum _textType;
  final TextStyle? _style;

  @override
  Widget build(BuildContext context) {
    final text = Text(
      _data,
      softWrap: true,
      textAlign: _textAlign,
      style: _style ?? _textType.getStyle(context),
    );

    if (_data.isURL()) {
      return MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: _data.launchLink,
          child: text,
        ),
      );
    }

    return text;
  }
}
