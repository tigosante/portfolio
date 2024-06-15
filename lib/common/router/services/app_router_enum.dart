enum AppRouterEnum {
  root(path: '/'),
  home(path: '/');

  final String path;

  const AppRouterEnum({required this.path});
}
