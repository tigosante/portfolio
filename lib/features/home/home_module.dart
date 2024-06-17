import 'package:flutter_modular/flutter_modular.dart';
import 'package:portfolio/common/common.dart';
import 'package:portfolio/features/home/stores/project/project_store_impl.dart';
import 'package:portfolio/features/home/stores/stores.dart';
import 'package:portfolio/features/home/ui/pages/home_page.dart';

class HomeModule extends Module {
  static String get routePath => AppRouterEnum.home.routePath;

  @override
  List<Bind<Object>> get binds => [
        Bind((get) => ProjectStoreImpl(usecase: get())),
        Bind((get) => ApresentationStoreImpl(usecase: get())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute<dynamic>(
          '/',
          child: (context, _) => HomePage(skillStore: context.read()),
        ),
      ];
}
