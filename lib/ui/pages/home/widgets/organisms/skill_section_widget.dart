import 'package:flutter/material.dart';
import 'package:portfolio/common/common.dart' show BuildContextExtension, StringExtension;
import 'package:portfolio/domain/domain.dart' show SkillEntity;
import 'package:portfolio/ui/pages/home/widgets/widgets.dart' show SkillWidget;
import 'package:portfolio/ui/ui.dart';

class SkillSectionData {
  const SkillSectionData({
    required this.title,
    required this.skills,
  });

  final String title;
  final List<SkillEntity> skills;
}

// ignore: must_be_immutable
class SkillSectionWidget extends StatelessWidget {
  SkillSectionWidget({
    required SkillSectionData data,
    super.key,
  }) : _data = data;

  final SkillSectionData _data;

  bool _showTitle = false;
  void Function(void Function())? _titleState;

  @override
  Widget build(BuildContext context) {
    final title = _data.title.captalize();

    return MouseRegion(
      onEnter: (_) => _titleState?.call(() => _showTitle = true),
      onExit: (_) => _titleState?.call(() => _showTitle = false),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: context.dimensions.paddingLarge,
            child: StatefulBuilder(
              builder: (context, state) {
                _titleState = state;
                return AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  child: _showTitle
                      ? TextWidget(title, style: context.textTheme.bodyLarge.copyWith(fontWeight: FontWeight.bold))
                      : const SizedBox(),
                );
              },
            ),
          ),
          SizedBox(height: context.dimensions.paddingSmall),
          Wrap(
            spacing: context.dimensions.paddingLarge,
            runSpacing: context.dimensions.paddingLarge,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: _data.skills.map(SkillWidget.new).toList(),
          ),
        ],
      ),
    );
  }
}
