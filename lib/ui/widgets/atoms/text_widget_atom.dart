import 'package:flutter/material.dart';
import 'package:portfolio/common/common.dart';
import 'package:portfolio/ui/ui.dart';

class TextWidgetAtom extends StatefulWidget {
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
  State<TextWidgetAtom> createState() => _TextWidgetAtomState();
}

class _TextWidgetAtomState extends State<TextWidgetAtom> {
  @override
  Widget build(BuildContext context) {
    final text = Text(
      widget._data,
      softWrap: true,
      maxLines: widget._maxLines,
      overflow: widget._overflow,
      textAlign: widget._textAlign,
      style: widget._style ?? context.textTheme.bodyMedium,
    );

    if (widget._data.isURL()) {
      return MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: widget._data.launchLink,
          child: text,
        ),
      );
    }

    return text;
  }
}
