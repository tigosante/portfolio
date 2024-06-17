import 'package:flutter/material.dart';
import 'package:portfolio/common/common.dart';
import 'package:portfolio/domain/domain.dart';
import 'package:portfolio/ui/ui.dart';

class SkillsListWidgetOrganism extends StatefulWidget {
  const SkillsListWidgetOrganism({required List<SkillEntity> data, super.key}) : _data = data;

  final List<SkillEntity> _data;

  @override
  State<SkillsListWidgetOrganism> createState() => SkillsListWidgetOrganismState();
}

class SkillsListWidgetOrganismState extends State<SkillsListWidgetOrganism> {
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
      return setState(() => _isSearching = false);
    }

    final queryFixed = query.toLowerCase().replaceAll(',', ' ').split(' ')..removeWhere((part) => part.isEmpty);
    _searchedData
      ..clear()
      ..addAll(widget._data.where((skill) => queryFixed.where(skill.searchtext.toLowerCase().contains).isNotEmpty));
    setState(() => _isSearching = true);
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
