import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/common/common.dart' show AppInjector, Environment;
import 'package:portfolio/common/env/environment_impl.dart';
import 'package:portfolio/data/data.dart';
import 'package:portfolio/data/datasources/github_datasource_impl.dart';
import 'package:portfolio/domain/domain.dart' show GetSkillsUsecase, SkillRepository;
import 'package:portfolio/domain/usecases/get_skills_usecase_impl.dart';
import 'package:portfolio/presenter/features/apresentation/store/apresentation_store_impl.dart';
import 'package:portfolio/presenter/features/features.dart' show ApresentationStore;
import 'package:portfolio/presenter/router/router.dart';
import 'package:portfolio/presenter/router/services/app_router_impl.dart';

AppInjector injectorHandler(AppInjector injector) {
  injector
    ..register<Environment>(EnvironmentImpl.new)
    ..register<Dio>(
      () => DioHttpClientImpl(authToken: injector<Environment>().githubAuthToken)
        ..options.baseUrl = injector<Environment>().githubBaseUrl,
    )
    ..register<GithubDatasource>(() => GithubDatasourceImpl(client: injector()))
    ..register<SkillRepository>(() => SkillRepositoryImpl(datasource: injector()))
    ..register<GetSkillsUsecase>(() => GetSkillsUsecaseImpl(repository: injector()))
    ..register<ApresentationStore>(() => ApresentationStoreImpl(env: injector(), usecase: injector()));

  final router = AppRouterImpl(
    provider: GoRouter(
      debugLogDiagnostics: kDebugMode,
      initialLocation: AppRouterEnum.root.path,
      routes: [
        HomeRoute(injector: injector),
      ],
    ),
  );
  return injector..register<AppRouter>(() => router);
}
