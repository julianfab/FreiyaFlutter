//import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';


abstract class AuthenticationState extends Equatable {
  //AuthenticationState([List props = const []]) :super(props);
  @override
  List<Object> get props => [];

  String getDisplayName() => '';
  String getPhotoUrl() => '';
  String getUid() => '';
}

class AuthenticationUninitialized extends AuthenticationState {
  @override
  String toString() => 'Uninitialized';
}

class AuthenticationAuthenticated extends AuthenticationState {
  final FirebaseUser firebaseUser;
  AuthenticationAuthenticated(this.firebaseUser);
  @override
  List<Object> get props => [firebaseUser];
  @override
  String toString() => 'Authenticated - firebaseUser : ${firebaseUser.displayName}';

  @override
  String getDisplayName() => '${firebaseUser.displayName}';

  @override
  String getPhotoUrl() => '${firebaseUser.photoUrl}';

  @override
  String getUid() => '${firebaseUser.uid}';
}

class AuthenticationUnauthenticated extends AuthenticationState {
  @override
  String toString() => 'No authenticated';
}

class AuthenticationLoading extends AuthenticationState {
  @override
  String toString() => 'Authentication Loading';
}

