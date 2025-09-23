import 'package:godigi/data/models/src/user_model.dart';

abstract interface class UserRepository {
  Future<User?> getUser();

  Future<void> saveUser(User user);

  Future<void> removeUser();
}
