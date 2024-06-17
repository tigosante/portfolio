mixin GithubDatasource {
  Future<dynamic> getFileData({required String owner, required String repo, required String fileName});
}
