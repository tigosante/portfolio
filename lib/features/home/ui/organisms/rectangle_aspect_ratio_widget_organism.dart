import 'package:flutter/material.dart';
import 'package:portfolio/domain/domain.dart';
import 'package:portfolio/features/home/ui/ui.dart';
import 'package:portfolio/ui/ui.dart';

class RectangleAspectRatioWidgetOrganism extends StatefulWidget {
  const RectangleAspectRatioWidgetOrganism({
    required ProjectModel project,
    super.key,
  }) : _project = project;

  final ProjectModel _project;

  @override
  State<RectangleAspectRatioWidgetOrganism> createState() => _RectangleAspectRatioWidgetMoleculeState();
}

class _RectangleAspectRatioWidgetMoleculeState extends State<RectangleAspectRatioWidgetOrganism> {
  void Function(void Function())? _state;
  bool _isHover = false;

  @override
  Widget build(BuildContext context) {
    const cardWidth = 350.0;
    final detailsColor = context.colorScheme.onSurface;
    const animateDuration = Duration(milliseconds: 200);
    final isLight = context.colorScheme.brightness.isLight;
    final cardShadowColor = isLight ? context.colorScheme.shadow : Colors.white;
    final cardColor = isLight ? context.colorScheme.tertiary : context.colorScheme.primary.withOpacity(0.05);

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
                color: isLight ? null : context.colorScheme.surface,
                borderRadius: BorderRadius.circular(context.measuries.borderRadiusLarge),
                boxShadow: [
                  if (_isHover)
                    BoxShadow(
                      blurRadius: 10,
                      spreadRadius: 0.1,
                      offset: const Offset(0, 4),
                      color: cardShadowColor.withOpacity(0.2),
                    )
                  else
                    BoxShadow(
                      blurRadius: 10,
                      spreadRadius: 2,
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
                    ProjectTitleMolecule(
                      isHover: _isHover,
                      project: widget._project,
                      detailsColor: detailsColor,
                      animateDuration: animateDuration,
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
                    SkillsWidgetMolecule(
                      isHover: _isHover,
                      detailsColor: detailsColor,
                      skills: widget._project.skills,
                      animateDuration: animateDuration,
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
