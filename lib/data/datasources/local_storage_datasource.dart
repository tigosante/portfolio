mixin LocalStorageDatasource {
  Future<bool> haveSkills();
  Future<bool> haveProjects();
  Future<List<Map<String, dynamic>>> getSkills(List<String> ids);

  Future<List<Map<String, dynamic>>> getAllSkills();
  Future<bool> saveSkills(List<Map<String, dynamic>> skills);

  Future<List<Map<String, dynamic>>> getProjects();
  Future<bool> saveProjects(List<Map<String, dynamic>> projects);
}
