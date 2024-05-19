import 'package:either_dart/either.dart' show Either, Right;
import 'package:portfolio/common/common.dart' show BaseException;
import 'package:portfolio/data/models/skill_model.dart';
import 'package:portfolio/domain/domain.dart' show SkillRepository;

class SkillRepositoryImpl implements SkillRepository {
  @override
  Future<Either<BaseException, List<SkillModel>>> getSkills() async {
    return Right(
      List.generate(
        19,
        (index) => SkillModel(
          name: 'Dart ${index + 1}',
          color: '#000000',
          imageUrl: '',
          startWork: '2019',
          type: 'Lang',
          showLogo: false,
        ),
      ),
    );
  }
}
