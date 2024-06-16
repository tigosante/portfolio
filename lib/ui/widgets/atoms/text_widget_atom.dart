import 'package:flutter/material.dart';
import 'package:portfolio/common/common.dart';
import 'package:portfolio/ui/ui.dart';

class TextWidgetAtom extends StatelessWidget {
  const TextWidgetAtom(
    String data, {
    super.key,
    TextAlign textAlign = TextAlign.left,
    int? maxLines,
    TextStyle? style,
    TextOverflow? overflow,
  })  : _data = data,
        _style = style,
        _maxLines = maxLines,
        _textAlign = textAlign,
        _overflow = maxLines == null ? overflow ?? TextOverflow.ellipsis : null;

  final String _data;
  final TextAlign _textAlign;

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
      style: _style ?? context.textTheme.bodyMedium,
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
