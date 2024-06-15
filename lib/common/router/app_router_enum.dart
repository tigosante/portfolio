enum AppRouterEnum {
  home(path: '/');

  final String path;
  final Map<String, String> params;

  const AppRouterEnum({required this.path, this.params = const {}});
}
