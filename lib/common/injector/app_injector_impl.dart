import 'package:get_it/get_it.dart';
import 'package:portfolio/common/common.dart' show AppInjector;

class AppInjectorImpl implements AppInjector {
  factory AppInjectorImpl({required GetIt provider}) {
    return _instance ?? AppInjectorImpl._(provider: provider);
  }

  AppInjectorImpl._({required GetIt provider}) {
    _provider = provider;
  }

  late final GetIt _provider;

  static AppInjectorImpl? _instance;

  @override
  T call<T extends Object>() => _provider<T>();

  @override
  T get<T extends Object>() => _provider<T>();

  @override
  void register<T extends Object>(T Function() callback) {
    if (!_provider.isRegistered<T>()) {
      _provider.registerLazySingleton<T>(callback);
    }
  }
}
