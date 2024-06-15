import 'package:flutter/material.dart';
import 'package:portfolio/domain/domain.dart' show SkillEntity;
import 'package:portfolio/features/home/stores/stores.dart';
import 'package:portfolio/features/home/ui/ui.dart';
import 'package:portfolio/ui/ui.dart';

class ApresentationWidget extends StatefulWidget {
  const ApresentationWidget({
    required ApresentationStore store,
    super.key,
  }) : _store = store;

  final ApresentationStore _store;

  @override
  State<ApresentationWidget> createState() => _ApresentationWidgetState();
}

class _ApresentationWidgetState extends State<ApresentationWidget> {
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
    final horizontalPadding = context.measuries.paddingExtraLarge;
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
        SizedBox(height: context.measuries.paddingExtraLarge * 3),
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
        spacing: context.measuries.paddingMedium,
        runSpacing: context.measuries.paddingMedium,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: _data.map(SkillWidget.new).toList(),
      ),
    );
  }
}