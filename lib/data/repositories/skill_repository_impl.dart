import 'package:either_dart/either.dart' show Either, Left, Right;
import 'package:portfolio/common/common.dart' show BaseException, UnknowErrorException;
import 'package:portfolio/data/datasources/datasources.dart' show GithubDatasource;
import 'package:portfolio/data/models/skill_model.dart';
import 'package:portfolio/domain/domain.dart' show SkillRepository;

class SkillRepositoryImpl implements SkillRepository {
  SkillRepositoryImpl({
    required GithubDatasource datasource,
  }) : _datasource = datasource;

  final GithubDatasource _datasource;

  @override
  Future<Either<BaseException, List<SkillModel>>> getSkills({
    required String owner,
    required String repo,
    required String fileName,
  }) async {
    try {
      final data = await _datasource.getSkills(owner: owner, repo: repo, fileName: fileName);
      final skills = <SkillModel>[];
      data.forEach(
        (key, value) {
          final list = (value as List).cast<Map<String, dynamic>>();
          skills.addAll(list.map((json) => SkillModel.fromJson(json..['type'] = key)));
        },
      );
      return Right(skills);
    } on BaseException catch (exception) {
      return Left(exception);
    } catch (exception, stackTrace) {
      return Left(UnknowErrorException(message: exception.toString(), stackTrace: stackTrace));
    }
  }
}
