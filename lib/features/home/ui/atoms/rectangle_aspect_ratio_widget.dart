import 'package:flutter/material.dart';
import 'package:portfolio/ui/ui.dart';

class RectangleAspectRatioWidget extends StatefulWidget {
  const RectangleAspectRatioWidget({
    required double padding,
    required String imageUrl,
    super.key,
  })  : _padding = padding,
        _imageUrl = imageUrl;

  final double _padding;
  final String _imageUrl;

  @override
  State<RectangleAspectRatioWidget> createState() => _RectangleAspectRatioWidgetState();
}

class _RectangleAspectRatioWidgetState extends State<RectangleAspectRatioWidget> {
  void Function(void Function())? _state;

  bool _isHover = false;

  @override
  Widget build(BuildContext context) {
    const cardSize = 400.0;
    const cardExpandedSize = cardSize + 8;
    final cardBiggerSize = cardSize + widget._padding;

    return Container(
      alignment: Alignment.center,
      height: cardBiggerSize * 1.32,
      width: cardBiggerSize + (cardBiggerSize * 0.01),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onExit: (event) => _state?.call(() => _isHover = false),
        onEnter: (event) => _state?.call(() => _isHover = true),
        child: Stack(
          children: [
            StatefulBuilder(
              builder: (context, state) {
                _state = state;
                return AnimatedContainer(
                  curve: Curves.easeInOut,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  duration: const Duration(milliseconds: 200),
                  width: _isHover ? cardExpandedSize : cardSize,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(context.measuries.borderRadiusLarge),
                    boxShadow: [
                      if (_isHover)
                        BoxShadow(
                          blurRadius: 20,
                          spreadRadius: 0.5,
                          offset: const Offset(1, 3),
                          color: Colors.black.withOpacity(0.10),
                        )
                      else
                        BoxShadow(
                          blurRadius: 10,
                          spreadRadius: 2,
                          offset: const Offset(1, 2),
                          color: Colors.black.withOpacity(0.05),
                        ),
                    ],
                  ),
                  child: AspectRatio(
                    aspectRatio: 3 / 4,
                    child: Image.network(
                      widget._imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
            Padding(
              padding: EdgeInsets.all(context.measuries.paddingExtraLarge),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(
                    'Repository Name'.toUpperCase(),
                    style: context.textTheme.bodyLarge.copyWith(
                      fontWeight: FontWeight.w500,
                      color: context.colorScheme.secondary,
                    ),
                  ),
                  SizedBox(height: context.measuries.paddingSmall),
                  TextWidget(
                    'Project purpose, brief description.',
                    maxLines: 3,
                    style: context.textTheme.titleLarge.copyWith(color: context.colorScheme.secondary),
                  ),
                  SizedBox(height: context.measuries.paddingSmall),
                  TextWidget(
                    'Frameworks and languages ​​used.',
                    maxLines: 2,
                    style: context.textTheme.bodyLarge.copyWith(
                      fontWeight: FontWeight.w500,
                      color: context.colorScheme.secondary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}