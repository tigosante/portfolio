import 'dart:async';

import 'package:portfolio/domain/domain.dart';
import 'package:portfolio/features/home/stores/stores.dart';

class ProjectStoreImpl implements ProjectStore {
  ProjectStoreImpl({
    required GetProjectsUsecase usecase,
  }) : _usecase = usecase {
    _controller = StreamController<ProjectState>(sync: true)..add(ProjectInitialState());
  }

  final GetProjectsUsecase _usecase;
  late final StreamController<ProjectState> _controller;

  @override
  Stream<ProjectState> get stream => _controller.stream;

  @override
  Future<void> getSkills() async {
    _controller.add(ProjectLoadingState());
    final either = await _usecase();
    _controller.add(either.fold((left) => ProjectErrorState(left.code), ProjectSuccessState.new));
  }

  @override
  void dispose() {
    _controller.close();
  }
}
