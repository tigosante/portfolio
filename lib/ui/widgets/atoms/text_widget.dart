import 'package:flutter/material.dart';
import 'package:portfolio/common/common.dart';
import 'package:portfolio/ui/ui.dart' show AppTextTypeEnum;

class TextWidget extends StatelessWidget {
  const TextWidget(
    String data, {
    super.key,
    TextAlign textAlign = TextAlign.left,
    AppTextTypeEnum textType = AppTextTypeEnum.bodyMedium,
    int? maxLines,
    TextStyle? style,
    TextOverflow? overflow,
  })  : _data = data,
        _style = style,
        _textType = textType,
        _maxLines = maxLines,
        _textAlign = textAlign,
        _overflow = maxLines == null ? overflow ?? TextOverflow.ellipsis : null;

  final String _data;
  final TextAlign _textAlign;
  final AppTextTypeEnum _textType;

  final int? _maxLines;
  final TextStyle? _style;
  final TextOverflow? _overflow;

  @override
  Widget build(BuildContext context) {
    final text = Text(
      _data,
      softWrap: true,
      maxLines: _maxLines,
      overflow: _overflow,
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
