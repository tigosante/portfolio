import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:portfolio/common/exceptions/api_error_exception.dart';
import 'package:portfolio/common/exceptions/exceptions.dart' show BaseException;
import 'package:portfolio/data/models/models.dart' show SkillModel;
import 'package:portfolio/domain/repositories/skill_repository.dart';

import 'skill_repositoy_mock.dart';

void main() {
  group('SkillRepository |', () {
    late SkillRepository repository;

    setUp(() {
      repository = SkillRepositoryMock();
    });

    group('getSkills 🧪', () {
      final emptyList = <SkillModel>[];
      test('should return a list of SkillModel', () async {
        when(() => repository.getSkills()).thenAnswer((_) async => Right(emptyList));
        final skills = await repository.getSkills();
        expect(skills, isA<Either<BaseException, List<SkillModel>>>());
        final right = skills.right;
        expect(right, isA<List<SkillModel>>());
        expect(right.isEmpty, equals(true));
      });
      test('should return a empty list of SkillModel', () async {
        when(() => repository.getSkills()).thenAnswer((_) async => Right(emptyList));
        final skills = await repository.getSkills();
        expect(skills, isA<Either<BaseException, List<SkillModel>>>());
        expect(skills.right, isA<List<SkillModel>>());
        expect(skills.right.isEmpty, equals(true));
      });
      test('should return Dart Skill', () async {
        const skill = SkillModel(name: 'Dart', color: '#000000', imageUrl: '', startWork: '2019');
        when(() => repository.getSkills()).thenAnswer((_) async => const Right([skill]));
        final skills = await repository.getSkills();
        expect(skills, isA<Either<BaseException, List<SkillModel>>>());
        final right = skills.right;
        expect(right.isEmpty, false);
        expect(right.first, isA<SkillModel>());
        expect(right.first == skill, equals(true));
      });
    });
    group('getSkills 🧪', () {
      test('should return a Left BaseException value', () async {
        when(() => repository.getSkills()).thenAnswer((_) async => Left(ApiErrorException(message: 'Api error')));
        final skills = await repository.getSkills();
        expect(skills, isA<Either<BaseException, List<SkillModel>>>());
        expect(skills.isLeft, equals(true));
        final left = skills.left;
        expect(left, isA<ApiErrorException>());
        expect(left.code, equals(BaseException.codeValue + ApiErrorException.codeValue));
        expect(left.message, equals('Api error'));
        expect(left.stackTrace, equals(null));
      });
    });
  });
}
