import 'package:flutter/material.dart';
import 'package:portfolio/extensions/extensions.dart'
    show AppTypeExtension, BuildContextExtension;
import 'package:portfolio/ui/ui.dart' show TextWidget;

class ApresentationWidgetTemplate extends StatelessWidget {
  const ApresentationWidgetTemplate({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = context.appType.isDesktop;
    final sectionSize = context.appSize.width * (isDesktop ? 0.4 : 1);

    return Container(
      color: context.appColors.primary,
      padding: EdgeInsets.all(context.appDimensions.paddingMedium),
      child: Wrap(
        alignment:
            isDesktop ? WrapAlignment.center : WrapAlignment.spaceBetween,
        runSpacing: context.appDimensions.paddingMedium,
        spacing: context.appDimensions.paddingExtraLarge,
        children: [
          SizedBox(
            width: sectionSize,
            child: Container(
              color: Colors.red,
              child: TextWidget(
                'What is Lorem Ipsum?',
                style: context.appTextTheme.headlineMedium
                    .copyWith(color: context.appColors.secondary),
              ),
            ),
          ),
          SizedBox(
            width: sectionSize,
            child: Container(
              color: Colors.red,
              child: TextWidget(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
                style: context.appTextTheme.bodyMedium
                    .copyWith(color: context.appColors.surface),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
