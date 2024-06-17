import 'package:either_dart/either.dart';
import 'package:portfolio/common/common.dart' show BaseException;
import 'package:portfolio/domain/domain.dart' show DataRepository, SkillModel;
import 'package:portfolio/domain/usecases/get_skills_usecase.dart';

class GetSkillsUsecaseImpl implements GetSkillsUsecase {
  GetSkillsUsecaseImpl({
    required DataRepository repository,
  }) : _repository = repository;

  final DataRepository _repository;

  @override
  Future<Either<BaseException, List<SkillModel>>> call() async {
    return _repository.getAllSkills();
  }
}
