import 'package:go_router/go_router.dart' show GoRoute;
import 'package:portfolio/common/common.dart' show AppInjector, AppRouterEnum;
import 'package:portfolio/ui/ui.dart' show HomePage;

class HomeRoute extends GoRoute {
  HomeRoute({
    required AppInjector injector,
  }) : super(
          path: AppRouterEnum.home.path,
          builder: (context, state) => HomePage(skillStore: injector()),
        );
}
