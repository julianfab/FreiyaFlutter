import 'package:bloc/bloc.dart';
import 'login_event.dart';
import 'login_state.dart';
export 'login_event.dart';
export 'login_state.dart';

import 'dart:async';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';
import '../../repositories/user_repository.dart';
import '../../util/validators.dart';



class LoginBloc extends Bloc<LoginEvent, LoginState> {

  UserRepository _userRepository;

  LoginBloc({@required UserRepository userRepository})
    :assert (userRepository != null),
    _userRepository =userRepository;

  @override
  LoginState get initialState => LoginState.empty();

  @override
  Stream<Transition<LoginEvent, LoginState>> transformEvents(Stream<LoginEvent> events, Function(LoginEvent) next) {
    final nonDebounceStream = events.where((event) {
      return (event is! EmailChanged && event is! PasswordChanged);
    });

    final debounceStream = events.where((event) {
      return (event is EmailChanged || event is PasswordChanged);
    }).debounceTime(Duration(milliseconds: 1000));

    return super
        .transformEvents(nonDebounceStream.mergeWith([debounceStream]), next);
  }

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is EmailChanged) {
      yield* _mapEmailChangedToState(event.email);
    }
    if (event is PasswordChanged) {
      yield* _mapPasswordChangedToState(event.password);
    }
    if (event is LoginWithGooglePressed) {
      yield* _mapLoginWithGooglePressed();
    }
    if (event is LoginWithFacebookPressed) {
      yield* _mapLoginWithFacebookPressed();
    }
    if (event is LoginWithCredentialsPressed) {
      yield* _mapLoginWithCredentialPressed(
        email: event.email,
        password:event.password,
      );
    }
  }

  Stream<LoginState> _mapEmailChangedToState(String email) async*{
    yield state.update(
      isEmailValid: Validators.isValidEmail(email),
    );  
  }

  Stream<LoginState> _mapPasswordChangedToState(String password) async*{
    yield state.update(
      isEmailValid: Validators.isValidPassword(password),
    );     
  } 

  Stream<LoginState> _mapLoginWithGooglePressed() async*{
    try {
      await _userRepository.signInWithGoogle();
      yield LoginState.success();
    } catch (_) {
      yield LoginState.failure();
    }
  }

  Stream<LoginState> _mapLoginWithFacebookPressed() async*{
    try {
      await _userRepository.signInWithFacebook();
      yield LoginState.success();
    } catch (_) {
      yield LoginState.failure();
    }
  }

  Stream<LoginState> _mapLoginWithCredentialPressed({String email, String password}) async*{
    try {
      await _userRepository.signInWithCredentials(email, password);
      yield LoginState.success();
    } catch (_) {
      yield LoginState.failure();
    }
  }

}

