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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ListView(
            scrollDirection: Axis.vertical,
            physics: const ClampingScrollPhysics(),
            children: const [
              ApresentationWidget(),
              ProjectsWidget(),
            ],
          ),
          AppBar(
            title: TextWidget(
              'Header',
              style: context.appTextTheme.headlineMedium
                  .copyWith(color: context.appColors.secondary),
            ),
          ),
        ],
      ),
    );
  }
}
