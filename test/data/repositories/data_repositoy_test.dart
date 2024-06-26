import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:portfolio/common/common.dart' show ApiErrorException, BaseException;
import 'package:portfolio/domain/models/models.dart' show SkillModel;
import 'package:portfolio/domain/repositories/data_repository.dart';

import 'data_repositoy_mock.dart';

void main() {
  group('DataRepository |', () {
    late DataRepository repository;

    setUp(() {
      repository = DataRepositoryMock();
    });

    group('getSkills 🧪', () {
      final list = <SkillModel>[];

      test('should return a list of SkillModel', () async {
        when(() => repository.getAllSkills()).thenAnswer((_) async => Right(list));
        final skills = await repository.getAllSkills();
        expect(skills, isA<Either<BaseException, List<SkillModel>>>());
        final right = skills.right;
        expect(right, isA<List<SkillModel>>());
        expect(right.isEmpty, equals(true));
      });
      test('should return Dart Skill', () async {
        list.add(const SkillModel(type: 'Lang', name: 'Dart', color: '#000000', startWork: '2019'));
        when(() => repository.getAllSkills()).thenAnswer((_) async => Right(list));
        final skills = await repository.getAllSkills();
        expect(skills, isA<Either<BaseException, List<SkillModel>>>());
        final right = skills.right;
        expect(right.isEmpty, equals(false));
        expect(right.first, isA<SkillModel>());
        expect(right.first == list.first, equals(true));
      });
    });
    group('getSkills 🧪', () {
      test('should return a Left BaseException value', () async {
        when(() => repository.getAllSkills()).thenAnswer((_) async => Left(ApiErrorException(message: 'Api error')));
        final skills = await repository.getAllSkills();
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
