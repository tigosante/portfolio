import 'dart:async';

import 'package:portfolio/domain/domain.dart';
import 'package:portfolio/features/home/stores/stores.dart';

class ApresentationStoreImpl implements ApresentationStore {
  ApresentationStoreImpl({
    required GetSkillsUsecase usecase,
  }) : _usecase = usecase {
    _controller = StreamController<ApresentationState>(sync: true)..add(ApresentationInitialState());
  }

  final GetSkillsUsecase _usecase;
  late final StreamController<ApresentationState> _controller;

  @override
  Stream<ApresentationState> get stream => _controller.stream;

  @override
  Future<void> getSkills() async {
    _controller.add(ApresentationLoadingState());
    final either = await _usecase();
    _controller.add(either.fold((left) => ApresentationErrorState(left.code), ApresentationSuccessState.new));
  }

  @override
  void dispose() {
    _controller.close();
  }
}
