import 'dart:async';
import 'package:godigi/core/core.dart';
import 'package:godigi/data/enums/src/verification_method.dart';
import 'package:godigi/data/datasources/local/local_data_source.dart';
import 'package:godigi/domain/repositories/src/authentication_repository.dart';
import 'package:uuid/uuid.dart';
import 'package:godigi/data/models/src/user_model.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  AuthenticationRepositoryImpl({
    required LocalDataSource localDataSource,
  }) : _localDataSource = localDataSource;

  final LocalDataSource _localDataSource;
  final _controller = StreamController<AuthenticationStatus>();

  @override
  Stream<AuthenticationStatus> get status async* {
    await Future.delayed(const Duration(seconds: 1));
    final user = await _localDataSource.getUser();

    if (user != null) {
      if (user.otpDone) {
        yield AuthenticationStatus.authenticated;
      } else {
        yield AuthenticationStatus.otpRequired;
      }
    } else {
      yield AuthenticationStatus.unauthenticated;
    }

    yield* _controller.stream;
  }

  @override
  Future<bool> logIn({
    required String email,
    required String password,
  }) async {
    await Future.delayed(
      const Duration(milliseconds: 500),
      () async {
        if (email == StringConstants.dummyUsername && password == StringConstants.dummyPassword) {
          final userId = Uuid().v4();
          final user = User(id: userId, email: email, name: StringConstants.dummyName);
          await _localDataSource.saveUser(user);
          _controller.add(AuthenticationStatus.otpRequired);
          return true;
        } else {
          _controller.add(AuthenticationStatus.unauthenticated);
          return false;
        }
      },
    );
    return false;
  }

  @override
  Future<bool> verifyOtp({
    required String otp,
    required VerificationMethod verificationMethod,
  }) async {
    await Future.delayed(const Duration(milliseconds: 500));

    final validOtps = <VerificationMethod, String>{
      VerificationMethod.email: StringConstants.dummyEmail,
      VerificationMethod.whatsapp: StringConstants.dummyOtpWhatsapp,
    };

    final expectedOtp = validOtps[verificationMethod];
    final isOtpValid = expectedOtp != null && otp == expectedOtp;

    if (!isOtpValid) {
      return isOtpValid;
    }

    final user = await _localDataSource.getUser();

    if (user == null) {
      return false;
    }

    final updatedUser = user.copyWith(otpDone: true);

    await _localDataSource.saveUser(updatedUser);

    _controller.add(AuthenticationStatus.authenticated);

    return true;
  }

  @override
  Future<void> logOut() async {
    await _localDataSource.removeUser();
    _controller.add(AuthenticationStatus.unauthenticated);
  }

  @override
  void dispose() => _controller.close();
}
