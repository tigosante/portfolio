import 'package:either_dart/either.dart' show Either, Left, Right;
import 'package:portfolio/common/common.dart' show BaseException, Environment, UnknowErrorException;
import 'package:portfolio/data/datasources/datasources.dart' show GithubDatasource, LocalStorageDatasource;
import 'package:portfolio/domain/domain.dart' show DataRepository, ProjectModel, SkillModel;

class DataRepositoryImpl implements DataRepository {
  DataRepositoryImpl({
    required Environment env,
    required GithubDatasource githubDatasource,
    required LocalStorageDatasource localStorageDatasource,
  })  : _env = env,
        _githubDatasource = githubDatasource,
        _localStorageDatasource = localStorageDatasource;

  final Environment _env;
  final GithubDatasource _githubDatasource;
  final LocalStorageDatasource _localStorageDatasource;

  @override
  Future<Either<BaseException, List<SkillModel>>> getSkills(List<String> ids) async {
    try {
      final skills = await _localStorageDatasource.getSkills(ids);
      return Right(skills.map(SkillModel.fromJson).toList());
    } on BaseException catch (exception) {
      return Left(exception);
    } catch (exception, stackTrace) {
      return Left(UnknowErrorException(message: exception.toString(), stackTrace: stackTrace));
    }
  }

  @override
  Future<Either<BaseException, List<SkillModel>>> getAllSkills() async {
    try {
      if (await _localStorageDatasource.haveSkills()) {
        final skills = await _localStorageDatasource.getAllSkills();
        return Right(skills.map(SkillModel.fromJson).toList());
      }

      final data = await _githubDatasource.getFileData(
        owner: _env.githubUser,
        repo: _env.githubUser,
        fileName: _env.skillsFileName,
      );
      final skills = (data as Map<String, dynamic>)
          .map<String, SkillModel>(
            (skillName, data) => MapEntry(
              skillName,
              SkillModel.fromJson((data as Map<String, dynamic>)..['name'] = skillName),
            ),
          )
          .values
          .toSet()
          .toList();
      await _localStorageDatasource.saveSkills(skills.map((skill) => skill.toJson()).toList());
      return Right(skills);
    } on BaseException catch (exception) {
      return Left(exception);
    } catch (exception, stackTrace) {
      return Left(UnknowErrorException(message: exception.toString(), stackTrace: stackTrace));
    }
  }

  @override
  Future<Either<BaseException, List<ProjectModel>>> getProjects() async {
    try {
      if (await _localStorageDatasource.haveProjects()) {
        final skills = await _localStorageDatasource.getProjects();
        return Right(skills.map(ProjectModel.fromJson).toList());
      }

      final data = await _githubDatasource.getFileData(
        owner: _env.githubUser,
        repo: _env.githubUser,
        fileName: _env.projectsFileName,
      );
      final projects =
          (data as List<dynamic>).map((json) => ProjectModel.fromJson(json as Map<String, dynamic>)).toList();
      await _localStorageDatasource.saveProjects(projects.map((project) => project.toJson()).toList());
      return Right(projects);
    } on BaseException catch (exception) {
      return Left(exception);
    } catch (exception, stackTrace) {
      return Left(UnknowErrorException(message: exception.toString(), stackTrace: stackTrace));
    }
  }
}
