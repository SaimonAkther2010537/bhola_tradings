import 'package:get_storage/get_storage.dart';

import 'local_data_storage_repository.dart';


class LocalDataStorageRepositoryImpl extends definedKeys implements LocalDataStorageRepository {
  final GetStorage _storage = GetStorage();

  @override
  set accessToken(String accessToken) =>
      _storage.write(accessTokenKey, accessToken);

  @override
  String get accessToken => _storage.read<String>(accessTokenKey) ?? '';

  @override
  bool hasAccessToken() => _storage.hasData(accessTokenKey);


  @override
  set userName(String userName) => _storage.write(userNameKey, userName);

  @override
  String get userName => _storage.read<String>(userNameKey) ?? '';

  @override
  bool hasUserName() => _storage.hasData(userNameKey);


  @override
  set userRole(String userRole) => _storage.write(userRoleKey, userRole);

  @override
  String get userRole => _storage.read<String>(userRoleKey) ?? '';

  @override
  bool hasUserRole() => _storage.hasData(userRoleKey);




  @override
  void storeAllAuthData({
    required String accessToken,
    required String userRole,
    required String userName,

  }) {
    this.accessToken = accessToken;
    this.userRole = userRole;
    this.userName = userName;
  }


  @override
  void clearStoredData() {
    _storage.remove(accessTokenKey);
    _storage.remove(userRoleKey);
    _storage.remove(userNameKey);
  }
}


