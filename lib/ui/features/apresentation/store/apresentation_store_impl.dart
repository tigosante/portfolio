import 'dart:async';

import 'package:portfolio/domain/domain.dart' show GetSkillsUsecase;
import 'package:portfolio/ui/features/apresentation/store/store.dart';

class ApresentationStoreImpl implements ApresentationStore {
  ApresentationStoreImpl({
    required GetSkillsUsecase usecase,
  }) : _usecase = usecase {
    _controller = StreamController<ApresentationStates>(sync: true)..add(ApresentationInitialState());
  }

  final GetSkillsUsecase _usecase;
  late final StreamController<ApresentationStates> _controller;

  @override
  Stream<ApresentationStates> get stream => _controller.stream;

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
