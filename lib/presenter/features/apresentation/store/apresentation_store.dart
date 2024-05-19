import 'package:portfolio/presenter/features/apresentation/store/apresentation_states.dart' show ApresentationStates;

mixin ApresentationStore {
  Stream<ApresentationStates> get stream;
  Future<void> getSkills();
  void dispose();
}
