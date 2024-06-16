import 'package:flutter/material.dart';
import 'package:portfolio/common/common.dart';
import 'package:portfolio/ui/ui.dart';

class TextEmailWidgetAtom extends StatelessWidget {
  const TextEmailWidgetAtom(
    String email, {
    super.key,
    TextAlign textAlign = TextAlign.left,
    TextStyle? style,
    String? textReplacement,
  })  : _email = email,
        _style = style,
        _textAlign = textAlign,
        _textReplacement = textReplacement;

  final String _email;
  final TextAlign _textAlign;
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
          style: (_style ?? context.textTheme.bodyMedium).copyWith(
            decoration: _email.isURL() ? TextDecoration.underline : null,
          ),
        ),
      ),
    );
  }
}
