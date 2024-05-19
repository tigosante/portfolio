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
import 'package:portfolio/presenter/router/app_router_impl.dart';
import 'package:portfolio/presenter/router/router.dart';

AppInjector injectorHandler(AppInjector injector) {
  final httpHeader = {
    'Accept': 'application/vnd.github+json',
    // TODO: token
    'Authorization': 'Bearer <YOUR-TOKEN>',
    'X-GitHub-Api-Version': '2022-11-28',
  };
  injector
    ..register<Environment>(EnvironmentImpl.new)
    ..register<Dio>(() => Dio(BaseOptions(headers: httpHeader)))
    ..register<GithubDatasource>(() => GithubDatasourceImpl(client: injector()))
    ..register<SkillRepository>(() => SkillRepositoryImpl(datasource: injector()))
    ..register<GetSkillsUsecase>(() => GetSkillsUsecaseImpl(repository: injector()))
    ..register<ApresentationStore>(() => ApresentationStoreImpl(env: injector(), usecase: injector()));

  final routeProvider = GoRouter(
    debugLogDiagnostics: kDebugMode,
    initialLocation: AppRouterEnum.home.path,
    routes: [
      HomeRoute(injector: injector),
    ],
  );
  final router = AppRouterImpl()..provider(routeProvider);
  injector.register<AppRouter>(() => router);
  return injector;
}
