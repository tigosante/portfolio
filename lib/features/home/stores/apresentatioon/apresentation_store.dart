import 'package:portfolio/features/home/stores/stores.dart';

mixin ApresentationStore {
  Stream<ApresentationStates> get stream;
  Future<void> getSkills();
  void dispose();
}
