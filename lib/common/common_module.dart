import 'package:flutter_modular/flutter_modular.dart';
import 'package:portfolio/common/common.dart';
import 'package:portfolio/common/router/app_router_impl.dart';

class CommonModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind(
          export: true,
          isLazy: false,
          (_) => EnvironmentImpl(),
        ),
        Bind(
          export: true,
          isLazy: false,
          (_) => AppRouterImpl(provider: (Modular..setInitialRoute(AppRouterEnum.home.routePath)).to),
        ),
      ];
}
