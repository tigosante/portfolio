import 'package:either_dart/either.dart';
import 'package:portfolio/common/common.dart' show BaseException;
import 'package:portfolio/domain/domain.dart' show SkillEntity, SkillRepository;
import 'package:portfolio/domain/usecases/get_skills_usecase.dart';

class GetSkillsUsecaseImpl implements GetSkillsUsecase {
  GetSkillsUsecaseImpl({
    required SkillRepository repository,
  }) : _repository = repository;

  final SkillRepository _repository;

  @override
  Future<Either<BaseException, List<SkillEntity>>> call({
    required String owner,
    required String repo,
    required String fileName,
  }) async {
    return _repository.getSkills(owner: owner, repo: repo, fileName: fileName);
  }
}
