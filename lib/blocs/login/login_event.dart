import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class LoginEvent extends Equatable{

  LoginEvent([List props = const []]) : super(props);
}

class EmailChanged extends LoginEvent{
  final String email;

  EmailChanged({@required this.email})  :super([email]);

  @override
  String toString() => 'EmailChanged {email: $email}';
}

class PasswordChanged extends LoginEvent{
  final String password;

  PasswordChanged({@required this.password})  :super([password]);

  @override
  String toString() => 'PasswordChanged {password: $password}';
}

class Submited extends LoginEvent{
  final String email;
  final String password;

  Submited({@required this.email, @required this.password}) :super([email,password]);

  @override
  String toString() => 'Submited {email: $email, password: $password}';
}

class LoginWithGooglePressed extends LoginEvent {
  
}

class LoginWithFacebookPressed extends LoginEvent {
  
}

class LoginWithCredentialsPressed extends LoginEvent {
  final String email;
  final String password;

  LoginWithCredentialsPressed({@required this.email, @required this.password}) :super([email,password]);

  @override
  String toString() => 'LoginWithCredentials {email: $email, password: $password}';
}