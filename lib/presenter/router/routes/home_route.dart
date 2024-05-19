import 'package:go_router/go_router.dart' show GoRoute;
import 'package:portfolio/common/common.dart' show AppInjector;
import 'package:portfolio/presenter/presenter.dart' show AppRouterEnum, HomePage;

class HomeRoute extends GoRoute {
  HomeRoute({
    required AppInjector injector,
  }) : super(
          path: AppRouterEnum.home.path,
          builder: (context, state) => HomePage(skillStore: injector()),
        );
}
