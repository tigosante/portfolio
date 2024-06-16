import 'package:flutter/material.dart';
import 'package:portfolio/domain/domain.dart';
import 'package:portfolio/ui/ui.dart';

class SkillsWidgetMolecule extends StatefulWidget {
  const SkillsWidgetMolecule({
    required bool isHover,
    required Color detailsColor,
    required List<SkillEntity> skills,
    required Duration animateDuration,
    super.key,
  })  : _isHover = isHover,
        _skills = skills,
        _detailsColor = detailsColor,
        _animateDuration = animateDuration;

  final bool _isHover;
  final Color _detailsColor;
  final List<SkillEntity> _skills;
  final Duration _animateDuration;

  @override
  State<SkillsWidgetMolecule> createState() => _SkillsWidgetMoleculeState();
}

class _SkillsWidgetMoleculeState extends State<SkillsWidgetMolecule> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: double.infinity,
      duration: widget._animateDuration,
      height: 90 + (widget._isHover ? context.measuries.paddingMedium : 0),
      decoration: BoxDecoration(
        color: widget._detailsColor.withOpacity(widget._isHover ? 0.02 : 0),
        borderRadius: BorderRadius.all(Radius.circular(context.measuries.borderRadiusLarge)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: context.measuries.paddingSmall),
          AnimatedPadding(
            duration: widget._animateDuration,
            padding: EdgeInsets.symmetric(horizontal: context.measuries.paddingMedium),
            child: TextWidgetAtom(
              '${widget._skills.map((skill) => skill.name).reduce((value, next) => '$value, $next')}.',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: context.textTheme.labelLarge.copyWith(
                color: widget._detailsColor,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
