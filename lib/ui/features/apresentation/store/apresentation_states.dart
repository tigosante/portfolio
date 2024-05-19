import 'package:portfolio/domain/domain.dart' show SkillTypeEntity;

abstract class ApresentationStates {}

class ApresentationInitialState extends ApresentationStates {}

class ApresentationLoadingState extends ApresentationStates {}

class ApresentationSuccessState extends ApresentationStates {
  ApresentationSuccessState(this.data);

  final List<SkillTypeEntity> data;
}

class ApresentationErrorState extends ApresentationStates {
  ApresentationErrorState(this.message);

  final String message;
}
