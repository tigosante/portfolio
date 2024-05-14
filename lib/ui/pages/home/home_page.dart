import 'package:flutter/material.dart';
import 'package:portfolio/extensions/extensions.dart';
import 'package:portfolio/ui/pages/home/widgets/widgets.dart';
import 'package:portfolio/ui/ui.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> _widgets = [
    const ApresentationWidget(),
    const ProjectsWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    final headerTextStyle = context.appTextTheme.headlineMedium.copyWith(color: context.appColors.surface);

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: context.appColors.surfaceInverse,
      appBar: AppBarWidget(
        child: Wrap(
          alignment: WrapAlignment.center,
          spacing: context.appDimensions.noFactor.paddingSmall,
          children: List.generate(3, (index) => TextWidget('Option ${index + 1}', style: headerTextStyle)),
        ),
      ),
      body: ListView.separated(
        itemCount: _widgets.length,
        physics: const ClampingScrollPhysics(),
        itemBuilder: (context, index) => _widgets[index],
        separatorBuilder: (context, index) => SizedBox(height: context.appDimensions.paddingMedium),
      ),
    );
  }
}
