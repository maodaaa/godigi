import 'package:godigi/data/datasources/local/local_data_source.dart';
import 'package:godigi/data/models/src/user_model.dart';
import 'package:godigi/domain/repositories/src/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl({required LocalDataSource localDataSource})
    : _localDataSource = localDataSource;

  final LocalDataSource _localDataSource;
  User? _user;

  @override
  Future<User?> getUser() async {
    if (_user != null) return _user;

    final user = await _localDataSource.getUser();

    if (user == null) return null;

    _user = user;
    return _user;
  }

  @override
  Future<void> saveUser(User user) async {
    _user = user;
    await _localDataSource.saveUser(user);
  }

  @override
  Future<void> removeUser() async {
    _user = null;
    await _localDataSource.removeUser();
  }
}
