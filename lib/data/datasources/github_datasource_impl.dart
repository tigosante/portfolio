import 'package:dio/dio.dart';
import 'package:portfolio/common/common.dart' show ApiErrorException;
import 'package:portfolio/data/datasources/datasources.dart' show GithubDatasource;

class GithubDatasourceImpl implements GithubDatasource {
  GithubDatasourceImpl({required Dio client}) : _client = client;

  final Dio _client;

  @override
  Future<List<Map<String, dynamic>>> getSkills({
    required String owner,
    required String repo,
    required String fileName,
  }) async {
    try {
      final response = await _client.get<Map<String, dynamic>>('/repos/$owner/$repo/contents/$fileName');
      final data = response.data!;
      return data['content'] as List<Map<String, dynamic>>;
    } catch (exception, stackTrace) {
      throw ApiErrorException(message: exception.toString(), stackTrace: stackTrace);
    }
  }
}
