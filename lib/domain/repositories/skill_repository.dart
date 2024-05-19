import 'package:either_dart/either.dart';
import 'package:portfolio/common/common.dart' show BaseException;
import 'package:portfolio/data/models/models.dart' show SkillModel;

mixin SkillRepository {
  Future<Either<BaseException, List<SkillModel>>> getSkills({
    required String owner,
    required String repo,
    required String fileName,
  });
}
