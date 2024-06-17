import 'package:flutter_modular/flutter_modular.dart';
import 'package:portfolio/common/common.dart';
import 'package:portfolio/data/data.dart';
import 'package:portfolio/data/datasources/github_datasource_impl.dart';
import 'package:portfolio/data/datasources/local_storage_datasource_impl.dart';

class DataModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind(
          export: true,
          (get) => DioHttpClientImpl(authToken: get<Environment>().githubAuthToken)
            ..options.baseUrl = get<Environment>().githubBaseUrl,
        ),
        Bind(
          export: true,
          (get) => GithubDatasourceImpl(client: get()),
        ),
        Bind(
          export: true,
          (get) => LocalStorageDatasourceImpl(client: get()),
        ),
        Bind(
          export: true,
          (get) => DataRepositoryImpl(env: get(), githubDatasource: get(), localStorageDatasource: get()),
        ),
      ];
}
