import 'package:either_dart/either.dart';
import 'package:portfolio/common/common.dart' show BaseException;
import 'package:portfolio/domain/entities/entities.dart' show SkillEntity;

mixin GetSkillsUsecase {
  Future<Either<BaseException, List<SkillEntity>>> call({
    required String owner,
    required String repo,
    required String fileName,
  });
}
