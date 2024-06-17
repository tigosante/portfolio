import 'package:flutter/material.dart';
import 'package:portfolio/domain/domain.dart' show SkillModel;
import 'package:portfolio/features/home/stores/stores.dart';
import 'package:portfolio/features/home/ui/ui.dart';
import 'package:portfolio/ui/ui.dart';

class ApresentationWidgetTemplate extends StatefulWidget {
  const ApresentationWidgetTemplate({
    required ApresentationStore store,
    super.key,
  }) : _store = store;

  final ApresentationStore _store;

  @override
  State<ApresentationWidgetTemplate> createState() => _ApresentationWidgetTemplateState();
}

class _ApresentationWidgetTemplateState extends State<ApresentationWidgetTemplate> {
  final _skillList = <SkillModel>[];

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
    final measuries = context.measuries;
    final paddingMedium = measuries.paddingMedium;
    final horizontalPadding = measuries.paddingExtraLarge;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: measuries.horizontalScreenPadding + paddingMedium)
          .copyWith(top: measuries.paddingLarge),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Wrap(
            spacing: horizontalPadding,
            runSpacing: horizontalPadding,
            alignment: WrapAlignment.spaceBetween,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: const [
              UserPresentationWidgetMolecule(),
              ContactLinksWidgetOrganism(),
            ],
          ),
          SizedBox(height: measuries.paddingExtraLarge),
          if (_skillList.isNotEmpty)
            SkillsListWidgetOrganism(data: _skillList)
          else
            StreamBuilder<ApresentationState>(
              stream: widget._store.stream,
              builder: (context, snapshot) => switch (snapshot.data) {
                ApresentationErrorState(message: final code) => TextWidgetAtom(code),
                ApresentationSuccessState(data: final data) => SkillsListWidgetOrganism(
                    data: _skillList
                      ..clear()
                      ..addAll(data),
                  ),
                _ => const ApresentationLoadingMolecule(),
              },
            ),
        ],
      ),
    );
  }
}
