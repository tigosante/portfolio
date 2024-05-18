import 'package:either_dart/either.dart' show Either, Right;
import 'package:portfolio/common/exceptions/exceptions.dart' show BaseException;
import 'package:portfolio/data/models/skill_model.dart';
import 'package:portfolio/domain/domain.dart' show SkillRepository;

class SkillRepositoryImpl implements SkillRepository {
  @override
  Future<Either<BaseException, List<SkillModel>>> getSkills() async {
    return const Right([]);
  }
}
