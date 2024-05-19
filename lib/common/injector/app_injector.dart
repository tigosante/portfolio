mixin AppInjector {
  T call<T extends Object>();
  T get<T extends Object>();
  void register<T extends Object>(T Function() callback);
}
