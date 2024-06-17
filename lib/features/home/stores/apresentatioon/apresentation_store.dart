import 'package:portfolio/features/home/stores/stores.dart';

mixin ApresentationStore {
  Stream<ApresentationState> get stream;
  Future<void> getSkills();
  void dispose();
}
