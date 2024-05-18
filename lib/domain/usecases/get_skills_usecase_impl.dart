import 'package:either_dart/either.dart';
import 'package:portfolio/common/common.dart' show BaseException;
import 'package:portfolio/domain/entities/entities.dart' show SkillTypeEntity;
import 'package:portfolio/domain/usecases/get_skills_usecase.dart';

class GetSkillsUsecaseImpl implements GetSkillsUsecase {
  @override
  Future<Either<BaseException, List<SkillTypeEntity>>> call() async {
    return Right([SkillTypeEntity(title: '', skills: [])]);
  }
}
