// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'authentication_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthenticationEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthenticationEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthenticationEvent()';
}


}

/// @nodoc
class $AuthenticationEventCopyWith<$Res>  {
$AuthenticationEventCopyWith(AuthenticationEvent _, $Res Function(AuthenticationEvent) __);
}


/// Adds pattern-matching-related methods to [AuthenticationEvent].
extension AuthenticationEventPatterns on AuthenticationEvent {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( AuthenticationSubscriptionRequested value)?  subscriptionRequested,TResult Function( AuthenticationLogoutPressed value)?  logoutPressed,TResult Function( AuthenticationLoginRequested value)?  loginRequested,TResult Function( AuthenticationOtpVerified value)?  otpVerified,required TResult orElse(),}){
final _that = this;
switch (_that) {
case AuthenticationSubscriptionRequested() when subscriptionRequested != null:
return subscriptionRequested(_that);case AuthenticationLogoutPressed() when logoutPressed != null:
return logoutPressed(_that);case AuthenticationLoginRequested() when loginRequested != null:
return loginRequested(_that);case AuthenticationOtpVerified() when otpVerified != null:
return otpVerified(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( AuthenticationSubscriptionRequested value)  subscriptionRequested,required TResult Function( AuthenticationLogoutPressed value)  logoutPressed,required TResult Function( AuthenticationLoginRequested value)  loginRequested,required TResult Function( AuthenticationOtpVerified value)  otpVerified,}){
final _that = this;
switch (_that) {
case AuthenticationSubscriptionRequested():
return subscriptionRequested(_that);case AuthenticationLogoutPressed():
return logoutPressed(_that);case AuthenticationLoginRequested():
return loginRequested(_that);case AuthenticationOtpVerified():
return otpVerified(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( AuthenticationSubscriptionRequested value)?  subscriptionRequested,TResult? Function( AuthenticationLogoutPressed value)?  logoutPressed,TResult? Function( AuthenticationLoginRequested value)?  loginRequested,TResult? Function( AuthenticationOtpVerified value)?  otpVerified,}){
final _that = this;
switch (_that) {
case AuthenticationSubscriptionRequested() when subscriptionRequested != null:
return subscriptionRequested(_that);case AuthenticationLogoutPressed() when logoutPressed != null:
return logoutPressed(_that);case AuthenticationLoginRequested() when loginRequested != null:
return loginRequested(_that);case AuthenticationOtpVerified() when otpVerified != null:
return otpVerified(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  subscriptionRequested,TResult Function()?  logoutPressed,TResult Function( String email,  String password)?  loginRequested,TResult Function( String otp,  VerificationMethod verificationMethod)?  otpVerified,required TResult orElse(),}) {final _that = this;
switch (_that) {
case AuthenticationSubscriptionRequested() when subscriptionRequested != null:
return subscriptionRequested();case AuthenticationLogoutPressed() when logoutPressed != null:
return logoutPressed();case AuthenticationLoginRequested() when loginRequested != null:
return loginRequested(_that.email,_that.password);case AuthenticationOtpVerified() when otpVerified != null:
return otpVerified(_that.otp,_that.verificationMethod);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  subscriptionRequested,required TResult Function()  logoutPressed,required TResult Function( String email,  String password)  loginRequested,required TResult Function( String otp,  VerificationMethod verificationMethod)  otpVerified,}) {final _that = this;
switch (_that) {
case AuthenticationSubscriptionRequested():
return subscriptionRequested();case AuthenticationLogoutPressed():
return logoutPressed();case AuthenticationLoginRequested():
return loginRequested(_that.email,_that.password);case AuthenticationOtpVerified():
return otpVerified(_that.otp,_that.verificationMethod);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  subscriptionRequested,TResult? Function()?  logoutPressed,TResult? Function( String email,  String password)?  loginRequested,TResult? Function( String otp,  VerificationMethod verificationMethod)?  otpVerified,}) {final _that = this;
switch (_that) {
case AuthenticationSubscriptionRequested() when subscriptionRequested != null:
return subscriptionRequested();case AuthenticationLogoutPressed() when logoutPressed != null:
return logoutPressed();case AuthenticationLoginRequested() when loginRequested != null:
return loginRequested(_that.email,_that.password);case AuthenticationOtpVerified() when otpVerified != null:
return otpVerified(_that.otp,_that.verificationMethod);case _:
  return null;

}
}

}

/// @nodoc


class AuthenticationSubscriptionRequested implements AuthenticationEvent {
  const AuthenticationSubscriptionRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthenticationSubscriptionRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthenticationEvent.subscriptionRequested()';
}


}




/// @nodoc


class AuthenticationLogoutPressed implements AuthenticationEvent {
  const AuthenticationLogoutPressed();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthenticationLogoutPressed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthenticationEvent.logoutPressed()';
}


}




/// @nodoc


class AuthenticationLoginRequested implements AuthenticationEvent {
  const AuthenticationLoginRequested({required this.email, required this.password});
  

 final  String email;
 final  String password;

/// Create a copy of AuthenticationEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthenticationLoginRequestedCopyWith<AuthenticationLoginRequested> get copyWith => _$AuthenticationLoginRequestedCopyWithImpl<AuthenticationLoginRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthenticationLoginRequested&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password));
}


@override
int get hashCode => Object.hash(runtimeType,email,password);

@override
String toString() {
  return 'AuthenticationEvent.loginRequested(email: $email, password: $password)';
}


}

/// @nodoc
abstract mixin class $AuthenticationLoginRequestedCopyWith<$Res> implements $AuthenticationEventCopyWith<$Res> {
  factory $AuthenticationLoginRequestedCopyWith(AuthenticationLoginRequested value, $Res Function(AuthenticationLoginRequested) _then) = _$AuthenticationLoginRequestedCopyWithImpl;
@useResult
$Res call({
 String email, String password
});




}
/// @nodoc
class _$AuthenticationLoginRequestedCopyWithImpl<$Res>
    implements $AuthenticationLoginRequestedCopyWith<$Res> {
  _$AuthenticationLoginRequestedCopyWithImpl(this._self, this._then);

  final AuthenticationLoginRequested _self;
  final $Res Function(AuthenticationLoginRequested) _then;

/// Create a copy of AuthenticationEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? email = null,Object? password = null,}) {
  return _then(AuthenticationLoginRequested(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class AuthenticationOtpVerified implements AuthenticationEvent {
  const AuthenticationOtpVerified({required this.otp, required this.verificationMethod});
  

 final  String otp;
 final  VerificationMethod verificationMethod;

/// Create a copy of AuthenticationEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthenticationOtpVerifiedCopyWith<AuthenticationOtpVerified> get copyWith => _$AuthenticationOtpVerifiedCopyWithImpl<AuthenticationOtpVerified>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthenticationOtpVerified&&(identical(other.otp, otp) || other.otp == otp)&&(identical(other.verificationMethod, verificationMethod) || other.verificationMethod == verificationMethod));
}


@override
int get hashCode => Object.hash(runtimeType,otp,verificationMethod);

@override
String toString() {
  return 'AuthenticationEvent.otpVerified(otp: $otp, verificationMethod: $verificationMethod)';
}


}

/// @nodoc
abstract mixin class $AuthenticationOtpVerifiedCopyWith<$Res> implements $AuthenticationEventCopyWith<$Res> {
  factory $AuthenticationOtpVerifiedCopyWith(AuthenticationOtpVerified value, $Res Function(AuthenticationOtpVerified) _then) = _$AuthenticationOtpVerifiedCopyWithImpl;
@useResult
$Res call({
 String otp, VerificationMethod verificationMethod
});




}
/// @nodoc
class _$AuthenticationOtpVerifiedCopyWithImpl<$Res>
    implements $AuthenticationOtpVerifiedCopyWith<$Res> {
  _$AuthenticationOtpVerifiedCopyWithImpl(this._self, this._then);

  final AuthenticationOtpVerified _self;
  final $Res Function(AuthenticationOtpVerified) _then;

/// Create a copy of AuthenticationEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? otp = null,Object? verificationMethod = null,}) {
  return _then(AuthenticationOtpVerified(
otp: null == otp ? _self.otp : otp // ignore: cast_nullable_to_non_nullable
as String,verificationMethod: null == verificationMethod ? _self.verificationMethod : verificationMethod // ignore: cast_nullable_to_non_nullable
as VerificationMethod,
  ));
}


}

/// @nodoc
mixin _$AuthenticationState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthenticationState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthenticationState()';
}


}

/// @nodoc
class $AuthenticationStateCopyWith<$Res>  {
$AuthenticationStateCopyWith(AuthenticationState _, $Res Function(AuthenticationState) __);
}


/// Adds pattern-matching-related methods to [AuthenticationState].
extension AuthenticationStatePatterns on AuthenticationState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Unknown value)?  unknown,TResult Function( Authenticated value)?  authenticated,TResult Function( Unauthenticated value)?  unauthenticated,TResult Function( OtpRequired value)?  otpRequired,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Unknown() when unknown != null:
return unknown(_that);case Authenticated() when authenticated != null:
return authenticated(_that);case Unauthenticated() when unauthenticated != null:
return unauthenticated(_that);case OtpRequired() when otpRequired != null:
return otpRequired(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Unknown value)  unknown,required TResult Function( Authenticated value)  authenticated,required TResult Function( Unauthenticated value)  unauthenticated,required TResult Function( OtpRequired value)  otpRequired,}){
final _that = this;
switch (_that) {
case Unknown():
return unknown(_that);case Authenticated():
return authenticated(_that);case Unauthenticated():
return unauthenticated(_that);case OtpRequired():
return otpRequired(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Unknown value)?  unknown,TResult? Function( Authenticated value)?  authenticated,TResult? Function( Unauthenticated value)?  unauthenticated,TResult? Function( OtpRequired value)?  otpRequired,}){
final _that = this;
switch (_that) {
case Unknown() when unknown != null:
return unknown(_that);case Authenticated() when authenticated != null:
return authenticated(_that);case Unauthenticated() when unauthenticated != null:
return unauthenticated(_that);case OtpRequired() when otpRequired != null:
return otpRequired(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  unknown,TResult Function( User user)?  authenticated,TResult Function()?  unauthenticated,TResult Function( User user)?  otpRequired,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Unknown() when unknown != null:
return unknown();case Authenticated() when authenticated != null:
return authenticated(_that.user);case Unauthenticated() when unauthenticated != null:
return unauthenticated();case OtpRequired() when otpRequired != null:
return otpRequired(_that.user);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  unknown,required TResult Function( User user)  authenticated,required TResult Function()  unauthenticated,required TResult Function( User user)  otpRequired,}) {final _that = this;
switch (_that) {
case Unknown():
return unknown();case Authenticated():
return authenticated(_that.user);case Unauthenticated():
return unauthenticated();case OtpRequired():
return otpRequired(_that.user);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  unknown,TResult? Function( User user)?  authenticated,TResult? Function()?  unauthenticated,TResult? Function( User user)?  otpRequired,}) {final _that = this;
switch (_that) {
case Unknown() when unknown != null:
return unknown();case Authenticated() when authenticated != null:
return authenticated(_that.user);case Unauthenticated() when unauthenticated != null:
return unauthenticated();case OtpRequired() when otpRequired != null:
return otpRequired(_that.user);case _:
  return null;

}
}

}

/// @nodoc


class Unknown implements AuthenticationState {
  const Unknown();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Unknown);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthenticationState.unknown()';
}


}




/// @nodoc


class Authenticated implements AuthenticationState {
  const Authenticated(this.user);
  

 final  User user;

/// Create a copy of AuthenticationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthenticatedCopyWith<Authenticated> get copyWith => _$AuthenticatedCopyWithImpl<Authenticated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Authenticated&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,user);

@override
String toString() {
  return 'AuthenticationState.authenticated(user: $user)';
}


}

/// @nodoc
abstract mixin class $AuthenticatedCopyWith<$Res> implements $AuthenticationStateCopyWith<$Res> {
  factory $AuthenticatedCopyWith(Authenticated value, $Res Function(Authenticated) _then) = _$AuthenticatedCopyWithImpl;
@useResult
$Res call({
 User user
});


$UserCopyWith<$Res> get user;

}
/// @nodoc
class _$AuthenticatedCopyWithImpl<$Res>
    implements $AuthenticatedCopyWith<$Res> {
  _$AuthenticatedCopyWithImpl(this._self, this._then);

  final Authenticated _self;
  final $Res Function(Authenticated) _then;

/// Create a copy of AuthenticationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? user = null,}) {
  return _then(Authenticated(
null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User,
  ));
}

/// Create a copy of AuthenticationState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res> get user {
  
  return $UserCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}

/// @nodoc


class Unauthenticated implements AuthenticationState {
  const Unauthenticated();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Unauthenticated);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthenticationState.unauthenticated()';
}


}




/// @nodoc


class OtpRequired implements AuthenticationState {
  const OtpRequired(this.user);
  

 final  User user;

/// Create a copy of AuthenticationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OtpRequiredCopyWith<OtpRequired> get copyWith => _$OtpRequiredCopyWithImpl<OtpRequired>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OtpRequired&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,user);

@override
String toString() {
  return 'AuthenticationState.otpRequired(user: $user)';
}


}

/// @nodoc
abstract mixin class $OtpRequiredCopyWith<$Res> implements $AuthenticationStateCopyWith<$Res> {
  factory $OtpRequiredCopyWith(OtpRequired value, $Res Function(OtpRequired) _then) = _$OtpRequiredCopyWithImpl;
@useResult
$Res call({
 User user
});


$UserCopyWith<$Res> get user;

}
/// @nodoc
class _$OtpRequiredCopyWithImpl<$Res>
    implements $OtpRequiredCopyWith<$Res> {
  _$OtpRequiredCopyWithImpl(this._self, this._then);

  final OtpRequired _self;
  final $Res Function(OtpRequired) _then;

/// Create a copy of AuthenticationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? user = null,}) {
  return _then(OtpRequired(
null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User,
  ));
}

/// Create a copy of AuthenticationState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res> get user {
  
  return $UserCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}

// dart format on
