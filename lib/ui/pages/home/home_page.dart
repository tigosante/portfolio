import 'package:flutter/material.dart';
import 'package:portfolio/common/common.dart';
import 'package:portfolio/data/data.dart';
import 'package:portfolio/domain/usecases/get_skills_usecase_impl.dart';
import 'package:portfolio/features/apresentation/store/apresentation_store_impl.dart';
import 'package:portfolio/features/features.dart' show ApresentationFeatureWidget, ProjectsFeatureWidget;
import 'package:portfolio/ui/ui.dart' show AppBarWidget, TextWidget;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget get _appBar => AppBarWidget(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            3,
            (index) => Padding(
              padding: EdgeInsets.symmetric(horizontal: context.dimensions.paddingSmall),
              child: TextWidget(
                'Option ${index + 1}',
                style: context.textTheme.bodyMedium.copyWith(color: context.colors.primary),
              ),
            ),
          ),
        ),
      );

  List<Widget> get _children => [
        _appBar,
        Padding(
          padding: EdgeInsets.only(top: context.dimensions.paddingExtraLarge * 3),
          child: ApresentationFeatureWidget(
            // TODO
            store: ApresentationStoreImpl(usecase: GetSkillsUsecaseImpl(repository: SkillRepositoryImpl())),
          ),
        ),
        const ProjectsFeatureWidget(),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.topCenter,
        padding: EdgeInsets.symmetric(horizontal: context.dimensions.paddingLarge),
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: context.dimensions.screenMaxWidth),
          child: ListView.separated(
            shrinkWrap: true,
            itemCount: _children.length,
            physics: const ClampingScrollPhysics(),
            itemBuilder: (_, index) => _children[index],
            separatorBuilder: (_, index) => SizedBox(height: index == 0 ? 0 : context.dimensions.paddingExtraLarge),
          ),
        ),
      ),
    );
  }
}
