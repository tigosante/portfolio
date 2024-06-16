import 'package:flutter/material.dart';
import 'package:portfolio/common/common.dart';
import 'package:portfolio/domain/domain.dart';
import 'package:portfolio/ui/ui.dart';

class RectangleAspectRatioWidgetMolecule extends StatefulWidget {
  const RectangleAspectRatioWidgetMolecule({
    required ProjectEntity project,
    super.key,
  }) : _project = project;

  final ProjectEntity _project;

  @override
  State<RectangleAspectRatioWidgetMolecule> createState() => _RectangleAspectRatioWidgetMoleculeState();
}

class _RectangleAspectRatioWidgetMoleculeState extends State<RectangleAspectRatioWidgetMolecule> {
  void Function(void Function())? _state;

  bool _isHover = false;

  @override
  Widget build(BuildContext context) {
    const cardWidth = 350.0;
    final cardColor = context.colorScheme.surface;
    final detailsColor = context.colorScheme.onSurface;
    const animateDuration = Duration(milliseconds: 200);
    final cardShadowColor = context.colorScheme.brightness.isLight ? context.colorScheme.shadow : Colors.white;

    return SizedBox(
      width: cardWidth,
      height: cardWidth + 50,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onExit: (event) => _state?.call(() => _isHover = false),
        onEnter: (event) => _state?.call(() => _isHover = true),
        child: StatefulBuilder(
          builder: (context, state) {
            _state = state;
            return AnimatedContainer(
              curve: Curves.easeInOut,
              duration: animateDuration,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                color: cardColor,
                borderRadius: BorderRadius.circular(context.measuries.borderRadiusLarge),
                boxShadow: [
                  if (_isHover)
                    BoxShadow(
                      blurRadius: 20,
                      spreadRadius: 0.5,
                      offset: const Offset(1, 3),
                      color: cardShadowColor.withOpacity(0.1),
                    )
                  else
                    BoxShadow(
                      blurRadius: 10,
                      spreadRadius: 2,
                      offset: const Offset(1, 2),
                      color: cardShadowColor.withOpacity(0.05),
                    ),
                ],
              ),
              child: ColoredBox(
                color: cardColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AnimatedContainer(
                      width: double.infinity,
                      duration: animateDuration,
                      margin: EdgeInsets.all(_isHover ? context.measuries.paddingSmall : 0),
                      padding: EdgeInsets.symmetric(
                        horizontal: _isHover ? context.measuries.paddingSmall : context.measuries.paddingMedium,
                        vertical: _isHover ? context.measuries.paddingSmall : context.measuries.paddingMedium,
                      ),
                      decoration: BoxDecoration(
                        color: detailsColor.withOpacity(_isHover ? 0.02 : 0),
                        borderRadius: BorderRadius.all(Radius.circular(context.measuries.borderRadiusLarge)),
                      ),
                      child: AnimatedContainer(
                        duration: animateDuration,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextWidgetAtom(
                              widget._project.name.captalize(),
                              style: context.textTheme.titleMedium.copyWith(
                                color: detailsColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextWidgetAtom(
                              widget._project.date,
                              style: context.textTheme.titleMedium.copyWith(
                                color: detailsColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: context.measuries.paddingMedium),
                      child: TextWidgetAtom(
                        widget._project.description,
                        maxLines: 3,
                        style: context.textTheme.headlineMedium.copyWith(
                          color: detailsColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    AnimatedContainer(
                      width: double.infinity,
                      duration: animateDuration,
                      height: 90 + (_isHover ? context.measuries.paddingMedium : 0),
                      decoration: BoxDecoration(
                        color: detailsColor.withOpacity(_isHover ? 0.02 : 0),
                        borderRadius: BorderRadius.all(Radius.circular(context.measuries.borderRadiusLarge)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: context.measuries.paddingSmall),
                          AnimatedPadding(
                            duration: animateDuration,
                            padding: EdgeInsets.symmetric(horizontal: context.measuries.paddingMedium),
                            child: TextWidgetAtom(
                              '${widget._project.skills.map((skill) => skill.name).reduce((value, next) => '$value, $next')}.',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: context.textTheme.labelLarge.copyWith(
                                color: detailsColor,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
