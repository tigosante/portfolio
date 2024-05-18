import 'package:flutter/material.dart';
import 'package:portfolio/extensions/extensions.dart' show BuildContextExtension, StringExtension;
import 'package:portfolio/ui/pages/home/widgets/widgets.dart';
import 'package:portfolio/ui/ui.dart' show IconType, TextEmailWidget, TextWidget;

class InfosLinkWidget extends StatelessWidget {
  const InfosLinkWidget({
    required String title,
    required String link,
    required IconType iconType,
    String? textReplacement,
    super.key,
  })  : _link = link,
        _title = title,
        _iconType = iconType,
        _textReplacement = textReplacement;

  final String _title;
  final String _link;
  final IconType _iconType;
  final String? _textReplacement;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AvatarCircleWidget(iconType: _iconType),
        SizedBox(width: context.dimensions.paddingSmall),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextWidget(
              _title,
              style: context.textTheme.bodyLarge.copyWith(color: context.colors.primary),
            ),
            if (_link.isURL())
              TextWidget(
                _link,
                style: context.textTheme.bodyLarge.copyWith(color: context.colors.link),
              )
            else
              TextEmailWidget(
                _link,
                textReplacement: _textReplacement,
                style: context.textTheme.bodyLarge.copyWith(color: context.colors.link),
              ),
          ],
        ),
      ],
    );
  }
}
