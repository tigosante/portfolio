import 'package:flutter_modular/flutter_modular.dart';
import 'package:portfolio/domain/usecases/get_skills_usecase_impl.dart';

class DomainModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind(
          export: true,
          (get) => GetSkillsUsecaseImpl(repository: get()),
        ),
      ];
}
