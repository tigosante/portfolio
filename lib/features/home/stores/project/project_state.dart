import 'package:portfolio/domain/domain.dart' show ProjectModel;

abstract class ProjectState {}

class ProjectInitialState extends ProjectState {}

class ProjectLoadingState extends ProjectState {}

class ProjectSuccessState extends ProjectState {
  ProjectSuccessState(this.data);

  final List<ProjectModel> data;
}

class ProjectErrorState extends ProjectState {
  ProjectErrorState(this.message);

  final String message;
}
