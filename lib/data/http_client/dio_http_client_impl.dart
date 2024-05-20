import 'package:dio/dio.dart';

class DioHttpClientImpl extends DioMixin {
  DioHttpClientImpl({required String authToken})
      : httpClientAdapter = HttpClientAdapter(),
        options = BaseOptions(
          headers: {
            'Accept': 'application/vnd.github+json',
            'Authorization': 'Bearer $authToken',
            'X-GitHub-Api-Version': '2022-11-28',
          },
        );

  @override
  // ignore: overridden_fields
  late BaseOptions options;

  @override
  // ignore: overridden_fields
  HttpClientAdapter httpClientAdapter;
}
