import 'package:either_dart/either.dart';
import 'package:portfolio/common/common.dart' show BaseException;
import 'package:portfolio/domain/models/models.dart';

mixin GetProjectsUsecase {
  Future<Either<BaseException, List<ProjectModel>>> call();
}
