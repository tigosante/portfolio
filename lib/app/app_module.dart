import 'package:flutter_modular/flutter_modular.dart';
import 'package:portfolio/common/common.dart';
import 'package:portfolio/data/data.dart';
import 'package:portfolio/domain/domain.dart';
import 'package:portfolio/features/features.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => [CommonModule(), DataModule(), DomainModule()];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute<HomeModule>(HomeModule.routePath, module: HomeModule()),
        WildcardRoute<dynamic>(
          child: (context, _) => NotFoundPage(
            onRedirectPressed: () => context.read<AppRouter>().replaceAll(AppRouterEnum.home),
          ),
        ),
      ];
}
