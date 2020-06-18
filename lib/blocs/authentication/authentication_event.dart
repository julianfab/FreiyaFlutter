import 'package:equatable/equatable.dart';
//import 'package:meta/meta.dart';

abstract class AuthenticationEvent extends Equatable {
  AuthenticationEvent([List props = const []]) : super(props);
}

class AppStarted extends AuthenticationEvent {
}

class LoggedIn extends AuthenticationEvent {
}

class LoggedOut extends AuthenticationEvent {
}