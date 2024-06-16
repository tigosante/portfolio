import 'package:flutter/material.dart';
import 'package:portfolio/common/common.dart';
import 'package:portfolio/domain/domain.dart' show SkillEntity;
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
            _SectionListWidget(data: _skillList)
          else
            StreamBuilder<ApresentationStates>(
              stream: widget._store.stream,
              builder: (context, snapshot) {
                return switch (snapshot.data) {
                  ApresentationErrorState(message: final code) => TextWidgetAtom(code),
                  ApresentationSuccessState(data: final data) => _SectionListWidget(
                      data: _skillList
                        ..clear()
                        ..addAll(data),
                    ),
                  ApresentationInitialState() ||
                  ApresentationLoadingState() ||
                  _ =>
                    const ApresentationLoadingMolecule(),
                };
              },
            ),
        ],
      ),
    );
  }
}

class _SectionListWidget extends StatefulWidget {
  const _SectionListWidget({required List<SkillEntity> data}) : _data = data;

  final List<SkillEntity> _data;

  @override
  State<_SectionListWidget> createState() => _SectionListWidgetState();
}

class _SectionListWidgetState extends State<_SectionListWidget> {
  late final TextEditingController _controller;
  final List<SkillEntity> _searchedData = [];

  bool _isSearching = false;

  List<SkillEntity> get _skills {
    if (_isSearching) {
      return _searchedData;
    }
    return widget._data;
  }

  @override
  void initState() {
    _controller = TextEditingController();
    _controller.addListener(_onSearch);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onSearch() {
    final query = _controller.text;
    if (query.isEmpty) {
      setState(() {
        _isSearching = false;
      });
      return;
    }

    final queryFixed = query.toLowerCase().replaceAll(',', ' ').split(' ')..removeWhere((part) => part.isEmpty);
    setState(() {
      _isSearching = true;
      _searchedData
        ..clear()
        ..addAll(widget._data.where((skill) => queryFixed.where(skill.searchtext.toLowerCase().contains).isNotEmpty));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: _controller,
          style: context.textTheme.bodyLarge.copyWith(fontWeight: FontWeight.w500),
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(context.measuries.borderRadiusLarge * 2),
            ),
            hintText: 'search_skill'.translate(),
            prefixIcon: IconsWidgetAtom.search(
              color: context.colorScheme.primary.withOpacity(0.3),
            ),
            hintStyle: context.textTheme.bodyLarge.copyWith(
              fontWeight: FontWeight.w500,
              color: context.colorScheme.primary.withOpacity(0.3),
            ),
          ),
        ),
        SizedBox(height: context.measuries.paddingSmall),
        Container(
          constraints: const BoxConstraints(minHeight: 200),
          child: Wrap(
            spacing: context.measuries.paddingSmall / 1.5,
            runSpacing: context.measuries.paddingSmall / 1.5,
            children: _skills.map(SkillWidgetMolecule.new).toList(),
          ),
        ),
      ],
    );
  }
}
