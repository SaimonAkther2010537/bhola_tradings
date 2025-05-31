abstract class definedKeys{
  final accessTokenKey = 'accessToken';
  final userRoleKey = 'userRole';
  final userNameKey = 'userName';
}

abstract class LocalDataStorageRepository {

  set accessToken(String accessToken);
  String get accessToken;
  bool hasAccessToken();

  set userRole(String userRole);
  String get userRole;
  bool hasUserRole();

  set userName(String userName);
  String get userName;
  bool hasUserName();


  void storeAllAuthData({
    required String accessToken,
    required String userRole,
    required String userName,
  });


  void clearStoredData();


}






