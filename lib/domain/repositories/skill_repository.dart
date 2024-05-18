import 'package:either_dart/either.dart';
import 'package:portfolio/common/common.dart' show BaseException;
import 'package:portfolio/data/models/models.dart' show SkillModel;

mixin SkillRepository<T extends SkillModel> {
  Future<Either<BaseException, List<T>>> getSkills();
}
