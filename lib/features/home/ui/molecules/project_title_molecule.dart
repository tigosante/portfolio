import 'package:flutter/material.dart';
import 'package:portfolio/common/common.dart';
import 'package:portfolio/domain/domain.dart';
import 'package:portfolio/ui/ui.dart';

class ProjectTitleMolecule extends StatefulWidget {
  const ProjectTitleMolecule({
    required bool isHover,
    required Color detailsColor,
    required ProjectModel project,
    required Duration animateDuration,
    super.key,
  })  : _isHover = isHover,
        _project = project,
        _detailsColor = detailsColor,
        _animateDuration = animateDuration;

  final bool _isHover;
  final Color _detailsColor;
  final ProjectModel _project;
  final Duration _animateDuration;

  @override
  State<ProjectTitleMolecule> createState() => _ProjectTitleMoleculeState();
}

class _ProjectTitleMoleculeState extends State<ProjectTitleMolecule> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: double.infinity,
      duration: widget._animateDuration,
      margin: EdgeInsets.all(widget._isHover ? context.measuries.paddingSmall : 0),
      padding: EdgeInsets.symmetric(
        horizontal: widget._isHover ? context.measuries.paddingSmall : context.measuries.paddingMedium,
        vertical: widget._isHover ? context.measuries.paddingSmall : context.measuries.paddingMedium,
      ),
      decoration: BoxDecoration(
        color: widget._detailsColor.withOpacity(widget._isHover ? 0.02 : 0),
        borderRadius: BorderRadius.all(Radius.circular(context.measuries.borderRadiusLarge)),
      ),
      child: AnimatedContainer(
        duration: widget._animateDuration,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextWidgetAtom(
              widget._project.name.captalize(),
              style: context.textTheme.titleMedium.copyWith(
                color: widget._detailsColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextWidgetAtom(
              '${widget._project.startWork} - ${widget._project.endWork}',
              style: context.textTheme.titleMedium.copyWith(color: widget._detailsColor),
            ),
          ],
        ),
      ),
    );
  }
}
