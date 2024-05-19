import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:portfolio/common/common.dart' show ApiErrorException, BaseException;
import 'package:portfolio/domain/domain.dart' show GetSkillsUsecase, SkillEntity, SkillTypeEntity;

import 'get_skills_usecase_mock.dart';

void main() {
  group('GetSkillsUsecaseMock |', () {
    late GetSkillsUsecase usecase;
    const owner = 'owner';
    const repo = 'repo';
    const fileName = 'fileName';

    setUp(() {
      usecase = GetSkillsUsecaseMock();
    });

    group('Success case  🧪', () {
      final list = <SkillTypeEntity>[];
      test('should return a list of SkillTypeEntity', () async {
        when(() => usecase(owner: owner, repo: repo, fileName: fileName)).thenAnswer((_) async => Right(list));
        final skills = await usecase(owner: owner, repo: repo, fileName: fileName);
        expect(skills, isA<Either<BaseException, List<SkillTypeEntity>>>());
        expect(skills.right.isEmpty, equals(true));
      });
      test('should return Lang section', () async {
        list.add(SkillTypeEntity(title: 'Lang', skills: []));
        when(() => usecase(owner: owner, repo: repo, fileName: fileName)).thenAnswer((_) async => Right(list));
        final skills = await usecase(owner: owner, repo: repo, fileName: fileName);

        expect(skills, isA<Either<BaseException, List<SkillTypeEntity>>>());
        final right = skills.right;
        expect(right.isEmpty, equals(false));
        expect(right.first == list.first, equals(true));
      });
      test('should return Lang section with dart skill', () async {
        const type = 'Lang';
        const skill = SkillEntity(name: 'Dart', imageUrl: '', color: '#205c9a', startWork: '2019', type: type);
        when(() => usecase(owner: owner, repo: repo, fileName: fileName)).thenAnswer(
          (_) async => Right([
            SkillTypeEntity(title: type, skills: const [skill]),
          ]),
        );
        final skills = await usecase(owner: owner, repo: repo, fileName: fileName);

        expect(skills, isA<Either<BaseException, List<SkillTypeEntity>>>());
        final right = skills.right;
        expect(right.isEmpty, equals(false));
        expect(right.first, isA<SkillTypeEntity>());
        final value = right.first.skills;
        expect(value, isA<List<SkillEntity>>());
        expect(value.first == skill, equals(true));
        expect(value.first.type, equals(type));
      });
    });
    group('Fail case  🧪', () {
      test('should return a Left BaseException value', () async {
        when(() => usecase(owner: owner, repo: repo, fileName: fileName))
            .thenAnswer((_) async => Left(ApiErrorException(message: 'Api error')));
        final skills = await usecase(owner: owner, repo: repo, fileName: fileName);
        expect(skills, isA<Either<BaseException, List<SkillTypeEntity>>>());
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
