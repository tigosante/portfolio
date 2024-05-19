import 'package:flutter/material.dart';
import 'package:portfolio/common/common.dart' show BuildContextExtension;
import 'package:portfolio/presenter/presenter.dart' show TextWidget;

class ProjectsFeatureWidget extends StatelessWidget {
  const ProjectsFeatureWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox();
    return Container(
      padding: EdgeInsets.all(context.dimensions.paddingMedium),
      constraints: BoxConstraints(maxWidth: context.dimensions.screenMaxWidth),
      child: Column(
        children: [
          Text(
            'Projects',
            style: context.textTheme.displayMedium.copyWith(color: context.colors.primary),
          ),
          SizedBox(height: context.dimensions.paddingMedium),
          TextWidget(
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
            style: context.textTheme.bodyLarge.copyWith(color: context.colors.secondary),
          ),
        ],
      ),
    );
  }
}
