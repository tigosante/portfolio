import 'package:portfolio/features/home/stores/project/project.dart';

mixin ProjectStore {
  Stream<ProjectState> get stream;
  Future<void> getSkills();
  void dispose();
}
