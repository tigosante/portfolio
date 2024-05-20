import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:portfolio/common/common.dart' show ApiErrorException, BaseException;
import 'package:portfolio/domain/domain.dart' show GetSkillsUsecase, SkillEntity;

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
      final list = <SkillEntity>[];
      test('should return a list of SkillEntity', () async {
        when(() => usecase(owner: owner, repo: repo, fileName: fileName)).thenAnswer((_) async => Right(list));
        final skills = await usecase(owner: owner, repo: repo, fileName: fileName);
        expect(skills, isA<Either<BaseException, List<SkillEntity>>>());
        expect(skills.right.isEmpty, equals(true));
      });
      test('should return Lang skill', () async {
        const type = 'Lang';
        const langName = 'Dart';
        list.add(const SkillEntity(type: type, name: langName, imageUrl: '', color: '#205c9a', startWork: '2019'));
        when(() => usecase(owner: owner, repo: repo, fileName: fileName)).thenAnswer((_) async => Right(list));
        final skills = await usecase(owner: owner, repo: repo, fileName: fileName);

        expect(skills, isA<Either<BaseException, List<SkillEntity>>>());
        final right = skills.right;
        expect(right.isEmpty, equals(false));
        final skill = right.first;
        expect(skill == list.first, equals(true));
        expect(skill.type, equals(type));
        expect(skill.type, equals(type));
        expect(skill.name, equals(langName));
      });
    });
    group('Fail case  🧪', () {
      test('should return a Left BaseException value', () async {
        when(() => usecase(owner: owner, repo: repo, fileName: fileName))
            .thenAnswer((_) async => Left(ApiErrorException(message: 'Api error')));
        final skills = await usecase(owner: owner, repo: repo, fileName: fileName);
        expect(skills, isA<Either<BaseException, List<SkillEntity>>>());
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
