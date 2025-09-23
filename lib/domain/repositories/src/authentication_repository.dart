import 'dart:async';
import 'package:godigi/data/enums/src/verification_method.dart';

enum AuthenticationStatus { unknown, authenticated, unauthenticated, otpRequired }

abstract interface class AuthenticationRepository {
  Stream<AuthenticationStatus> get status;

  Future<bool> logIn({
    required String email,
    required String password,
  });

  Future<bool> verifyOtp({
    required String otp,
    required VerificationMethod verificationMethod,
  });

  Future<void> logOut();

  void dispose();
}
