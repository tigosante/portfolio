import 'package:portfolio/domain/domain.dart' show SkillEntity;

abstract class ApresentationStates {}

class ApresentationInitialState extends ApresentationStates {}

class ApresentationLoadingState extends ApresentationStates {}

class ApresentationSuccessState extends ApresentationStates {
  ApresentationSuccessState(this.data);

  final List<SkillEntity> data;
}

class ApresentationErrorState extends ApresentationStates {
  ApresentationErrorState(this.message);

  final String message;
}
