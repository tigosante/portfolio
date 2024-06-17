import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:portfolio/common/common.dart' show ApiErrorException, BaseException;
import 'package:portfolio/domain/domain.dart' show GetSkillsUsecase, SkillModel;

import 'get_skills_usecase_mock.dart';

void main() {
  group('GetSkillsUsecaseMock |', () {
    late GetSkillsUsecase usecase;

    setUp(() {
      usecase = GetSkillsUsecaseMock();
    });

    group('Success case  🧪', () {
      final list = <SkillModel>[];
      test('should return a list of SkillModel', () async {
        when(() => usecase()).thenAnswer((_) async => Right(list));
        final skills = await usecase();
        expect(skills, isA<Either<BaseException, List<SkillModel>>>());
        expect(skills.right.isEmpty, equals(true));
      });
      test('should return Lang skill', () async {
        const type = 'Lang';
        const langName = 'Dart';
        list.add(const SkillModel(type: type, name: langName, color: '#205c9a', startWork: '2019'));
        when(() => usecase()).thenAnswer((_) async => Right(list));
        final skills = await usecase();

        expect(skills, isA<Either<BaseException, List<SkillModel>>>());
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
        when(() => usecase()).thenAnswer((_) async => Left(ApiErrorException(message: 'Api error')));
        final skills = await usecase();
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
