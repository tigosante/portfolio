import 'package:flutter/material.dart';
import 'package:portfolio/common/common.dart' show BuildContextExtension;
import 'package:portfolio/domain/domain.dart' show SkillEntity;
import 'package:portfolio/presenter/features/apresentation/store/store.dart';
import 'package:portfolio/presenter/features/apresentation/ui/ui.dart' show ApresentationLoadingWidget;
import 'package:portfolio/presenter/presenter.dart'
    show ContactLinksWidget, SkillWidget, TextWidget, UserPresentationWidget;

class ApresentationFeatureWidget extends StatefulWidget {
  const ApresentationFeatureWidget({
    required ApresentationStore store,
    super.key,
  }) : _store = store;

  final ApresentationStore _store;

  @override
  State<ApresentationFeatureWidget> createState() => _ApresentationFeatureWidgetState();
}

class _ApresentationFeatureWidgetState extends State<ApresentationFeatureWidget> {
  final _skillList = <SkillEntity>[];

  @override
  void initState() {
    widget._store.getSkills();
    super.initState();
  }

  @override
  void dispose() {
    widget._store.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final horizontalPadding = context.dimensions.paddingExtraLarge;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
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
        if (_skillList.isNotEmpty)
          _SectionListWidget(data: _skillList)
        else
          StreamBuilder<ApresentationStates>(
            stream: widget._store.stream,
            builder: (context, snapshot) {
              return switch (snapshot.data) {
                ApresentationErrorState(message: final code) => TextWidget(code),
                ApresentationSuccessState(data: final data) => _SectionListWidget(
                    data: _skillList
                      ..clear()
                      ..addAll(data),
                  ),
                ApresentationInitialState() || ApresentationLoadingState() || _ => const ApresentationLoadingWidget(),
              };
            },
          ),
      ],
    );
  }
}

class _SectionListWidget extends StatelessWidget {
  const _SectionListWidget({required List<SkillEntity> data}) : _data = data;

  final List<SkillEntity> _data;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Wrap(
        runAlignment: WrapAlignment.spaceBetween,
        spacing: context.dimensions.paddingMedium,
        runSpacing: context.dimensions.paddingMedium,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: _data.map(SkillWidget.new).toList(),
      ),
    );
  }
}
