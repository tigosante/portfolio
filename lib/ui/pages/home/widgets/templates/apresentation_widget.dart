import 'package:flutter/material.dart';
import 'package:portfolio/common/common.dart' show BuildContextExtension;
import 'package:portfolio/ui/pages/home/widgets/widgets.dart';

class ApresentationWidget extends StatelessWidget {
  const ApresentationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final horizontalPadding = context.dimensions.paddingExtraLarge;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          spacing: horizontalPadding,
          runSpacing: horizontalPadding,
          alignment: WrapAlignment.spaceBetween,
          children: const [
            UserPresentationWidget(),
            ContactLinksWidget(),
          ],
        ),
        SizedBox(height: context.dimensions.paddingExtraLarge * 3),
        Wrap(
          spacing: context.dimensions.paddingLarge,
          runSpacing: context.dimensions.paddingLarge,
          children: [
            for (final section in {
              // TODO
              'langs': [
                {
                  'name': 'Dart',
                  'color': '#FFEBEE',
                  'logo': '',
                },
              ],
            }.entries)
              SkillSectionWidget(
                data: SkillSectionData(
                  title: section.key,
                  skills: section.value.map(SkillData.fromJson).toList(),
                ),
              ),
          ],
        ),
      ],
    );
  }
}
