import 'package:either_dart/either.dart';
import 'package:portfolio/common/common.dart' show BaseException;
import 'package:portfolio/domain/models/models.dart';

mixin GetSkillsUsecase {
  Future<Either<BaseException, List<SkillModel>>> call();
}
