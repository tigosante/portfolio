import 'package:flutter/material.dart';
import 'package:portfolio/ui/ui.dart' show AppTextTypeEnum;

class TextWidget extends StatefulWidget {
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
  State<TextWidget> createState() => _TextWidgetState();
}

class _TextWidgetState extends State<TextWidget> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget._data,
      softWrap: true,
      textAlign: widget._textAlign,
      style: widget._style ?? widget._textType.getStyle(context),
    );
  }
}
