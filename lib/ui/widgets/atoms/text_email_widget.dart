import 'package:flutter/material.dart';
import 'package:portfolio/common/common.dart';
import 'package:portfolio/ui/ui.dart' show AppTextTypeEnum;

class TextEmailWidget extends StatelessWidget {
  const TextEmailWidget(
    String email, {
    super.key,
    TextAlign textAlign = TextAlign.left,
    AppTextTypeEnum textType = AppTextTypeEnum.bodyMedium,
    TextStyle? style,
    String? textReplacement,
  })  : _email = email,
        _style = style,
        _textType = textType,
        _textAlign = textAlign,
        _textReplacement = textReplacement;

  final String _email;
  final TextAlign _textAlign;
  final AppTextTypeEnum _textType;
  final TextStyle? _style;
  final String? _textReplacement;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: _email.launchLink,
        child: Text(
          _textReplacement ?? _email,
          maxLines: 5,
          softWrap: true,
          textAlign: _textAlign,
          style: (_style ?? _textType.getStyle(context)).copyWith(
            decoration: _email.isURL() ? TextDecoration.underline : null,
          ),
        ),
      ),
    );
  }
}
