import 'package:flutter/material.dart';
import 'package:portfolio/features/home/stores/stores.dart';
import 'package:portfolio/features/home/ui/ui.dart';
import 'package:portfolio/ui/ui.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    required ApresentationStore skillStore,
    super.key,
  }) : _skillStore = skillStore;

  final ApresentationStore _skillStore;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Widget get _appBar => AppBarWidget(
  //       child: Row(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: List.generate(
  //           3,
  //           (index) => Padding(
  //             padding: EdgeInsets.symmetric(horizontal: context.measuries.paddingSmall),
  //             child: TextWidget(
  //               'Option ${index + 1}',
  //               style: context.textTheme.bodyMedium.copyWith(color: context.colorScheme.primary),
  //             ),
  //           ),
  //         ),
  //       ),
  //     );

  List<Widget> get _children => [
        // TODO: corrigir
        // _appBar,
        // ApresentationFeatureWidget(store: widget._skillStore),
        const ProjectsWidgetTemplate(),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        shrinkWrap: true,
        itemCount: _children.length,
        physics: const ClampingScrollPhysics(),
        itemBuilder: (_, index) => _children[index],
        separatorBuilder: (_, index) => SizedBox(height: index == 0 ? 0 : context.measuries.paddingExtraLarge),
      ),
    );
  }
}
