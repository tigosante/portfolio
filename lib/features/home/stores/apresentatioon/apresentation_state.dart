import 'package:portfolio/domain/domain.dart' show SkillModel;

abstract class ApresentationState {}

class ApresentationInitialState extends ApresentationState {}

class ApresentationLoadingState extends ApresentationState {}

class ApresentationSuccessState extends ApresentationState {
  ApresentationSuccessState(this.data);

  final List<SkillModel> data;
}

class ApresentationErrorState extends ApresentationState {
  ApresentationErrorState(this.message);

  final String message;
}
