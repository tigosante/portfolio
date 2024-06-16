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
  List<Widget> get _children => [
        ApresentationWidgetTemplate(store: widget._skillStore),
        const ProjectsWidgetTemplate(),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: _children.length,
        physics: const ClampingScrollPhysics(),
        itemBuilder: (_, index) => Padding(
          padding: EdgeInsets.only(bottom: context.measuries.paddingExtraLarge),
          child: _children[index],
        ),
      ),
    );
  }
}
