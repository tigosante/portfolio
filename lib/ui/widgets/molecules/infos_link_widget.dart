import 'package:flutter/material.dart';
import 'package:portfolio/common/common.dart' show BuildContextExtension, ColorSchemeExtension, StringExtension;
import 'package:portfolio/ui/ui.dart' show AvatarCircleWidget, IconType, TextEmailWidget, TextWidget;

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
        SizedBox(width: context.measuries.paddingSmall),
        Flexible(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget(
                _title,
                maxLines: 5,
                style: context.textTheme.bodyLarge.copyWith(color: context.colorScheme.primary),
              ),
              if (_link.isURL())
                TextWidget(
                  _link,
                  maxLines: 5,
                  style: context.textTheme.bodyLarge.copyWith(color: context.colorScheme.link),
                )
              else
                TextEmailWidget(
                  _link,
                  textReplacement: _textReplacement,
                  style: context.textTheme.bodyLarge.copyWith(color: context.colorScheme.link),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
