import 'dart:convert';

import 'package:godigi/data/datasources/local/shared_pref_adapter.dart';
import 'package:godigi/data/models/src/user_model.dart';

abstract interface class LocalDataSource {
  Future<User?> getUser();

  Future<bool> saveUser(User user);

  Future<bool> removeUser();
}

class LocalDataSourceImpl implements LocalDataSource {
  LocalDataSourceImpl({required SharedPrefAdapter prefService}) : _prefService = prefService;

  final SharedPrefAdapter _prefService;
  static const _userCacheKey = '__user_cache_key__';

  @override
  Future<User?> getUser() async {
    final userJson = _prefService.readData<String>(_userCacheKey);

    if (userJson == null) return null;

    final user = User.fromJson(jsonDecode(userJson));
    return user;
  }

  @override
  Future<bool> saveUser(User user) async {
    final userJson = jsonEncode(user.toJson());
    return _prefService.saveData(_userCacheKey, userJson);
  }

  @override
  Future<bool> removeUser() => _prefService.removeData(_userCacheKey);
}
