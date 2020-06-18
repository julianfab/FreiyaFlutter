import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class RegisterEvent extends Equatable {

  RegisterEvent([List props = const []]) : super(props);
}

class EmailChanged extends RegisterEvent{
  final String email;

  EmailChanged({@required this.email}):super([email]);

  @override
  String toString() => 'EmailChanged {email: $email}';
}

class PasswordChanged extends RegisterEvent{
  final String password;

  PasswordChanged({@required this.password}):super([password]);

  @override
  String toString() => 'PasswordChanged {password: $password}';
}

class Submitted extends RegisterEvent{
  final String email;
  final String password;
  final String fullName;

  Submitted({@required this.email, @required this.password, @required this.fullName}):super([email,password, fullName]);

  @override
  String toString() => 'Submitted {email: $email, password: $password}';
}