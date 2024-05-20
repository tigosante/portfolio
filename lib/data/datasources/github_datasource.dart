mixin GithubDatasource {
  Future<Map<String, dynamic>> getSkills({required String owner, required String repo, required String fileName});
}
