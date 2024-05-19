import 'package:either_dart/either.dart';
import 'package:portfolio/common/common.dart' show BaseException;
import 'package:portfolio/domain/domain.dart' show SkillRepository, SkillTypeEntity;
import 'package:portfolio/domain/usecases/get_skills_usecase.dart';

class GetSkillsUsecaseImpl implements GetSkillsUsecase {
  GetSkillsUsecaseImpl({
    required SkillRepository repository,
  }) : _repository = repository;

  final SkillRepository _repository;

  @override
  Future<Either<BaseException, List<SkillTypeEntity>>> call() async {
    final either = await _repository.getSkills();
    return either.fold(
      Left.new,
      (skillList) {
        final types = <String, SkillTypeEntity>{};
        for (final skill in skillList) {
          types[skill.type] = (types[skill.type] ?? SkillTypeEntity(title: skill.type, skills: []))..skills.add(skill);
        }
        return Right(types.values.toList());
      },
    );
  }
}
