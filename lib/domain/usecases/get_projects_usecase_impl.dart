import 'package:either_dart/either.dart';
import 'package:portfolio/common/common.dart' show BaseException;
import 'package:portfolio/domain/domain.dart' show DataRepository, GetProjectsUsecase, ProjectModel;
import 'package:portfolio/domain/models/skill_model.dart';

class GetProjectsUsecaseImpl implements GetProjectsUsecase {
  GetProjectsUsecaseImpl({
    required DataRepository repository,
  }) : _repository = repository;

  final DataRepository _repository;

  @override
  Future<Either<BaseException, List<ProjectModel>>> call() async {
    return _repository.getProjects().thenLeft(Left.new).thenRight((right) async {
      return Right(
        await Future.wait(
          right.map(
            (project) => _repository
                .getSkills(project.skillIdList)
                .then((skills) => project..skills = skills.fold((_) => <SkillModel>[], (skills) => skills)),
          ),
        ),
      );
    });
  }
}
