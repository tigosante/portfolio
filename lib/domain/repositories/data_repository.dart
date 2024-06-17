import 'package:either_dart/either.dart';
import 'package:portfolio/common/common.dart' show BaseException;
import 'package:portfolio/domain/models/models.dart';

mixin DataRepository {
  Future<Either<BaseException, List<SkillModel>>> getSkills(List<String> ids);
  Future<Either<BaseException, List<SkillModel>>> getAllSkills();
  Future<Either<BaseException, List<ProjectModel>>> getProjects();
}
