import 'package:flutter/material.dart';
import 'package:portfolio/ui/pages/home/widgets/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        scrollDirection: Axis.vertical,
        physics: const ClampingScrollPhysics(),
        children: const [
          ApresentationWidgetTemplate(),
          ProjectsWidgetTemplate(),
        ],
      ),
    );
  }
}
