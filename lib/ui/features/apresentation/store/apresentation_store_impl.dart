import 'dart:async';

import 'package:portfolio/common/common.dart';
import 'package:portfolio/domain/domain.dart' show GetSkillsUsecase;
import 'package:portfolio/ui/features/apresentation/store/store.dart';

class ApresentationStoreImpl implements ApresentationStore {
  ApresentationStoreImpl({
    required Environment env,
    required GetSkillsUsecase usecase,
  })  : _env = env,
        _usecase = usecase {
    _controller = StreamController<ApresentationStates>(sync: true)..add(ApresentationInitialState());
  }

  final Environment _env;
  final GetSkillsUsecase _usecase;
  late final StreamController<ApresentationStates> _controller;

  @override
  Stream<ApresentationStates> get stream => _controller.stream;

  @override
  Future<void> getSkills() async {
    _controller.add(ApresentationLoadingState());
    final either = await _usecase(owner: _env.githubUser, repo: _env.githubUser, fileName: _env.skillsFileName);
    _controller.add(either.fold((left) => ApresentationErrorState(left.code), ApresentationSuccessState.new));
  }

  @override
  void dispose() {
    _controller.close();
  }
}
