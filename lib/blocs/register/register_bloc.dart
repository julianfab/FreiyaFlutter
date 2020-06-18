import 'package:freiyaflutter/repositories/user_repository.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';
import '../../util/validators.dart';
import 'dart:async';

import 'register_state.dart';
import 'registet_event.dart';
import 'package:bloc/bloc.dart';

export 'register_state.dart';
export 'registet_event.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {

  final UserRepository _userRepository;

  RegisterBloc({@required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository;

  @override
  RegisterState get initialState => RegisterState.empty();

  @override
  Stream<Transition<RegisterEvent, RegisterState>> transformEvents(Stream<RegisterEvent> events, Function(RegisterEvent) next) {
    final nonDebounceStream = events.where((event) {
      return (event is! EmailChanged && event is! PasswordChanged);
    });

    final debounceStream = events.where((event) {
      return (event is EmailChanged || event is PasswordChanged);
    }).debounceTime(Duration(milliseconds: 300));

    return super
        .transformEvents(nonDebounceStream.mergeWith([debounceStream]), next);
  }

  @override
  Stream<RegisterState> mapEventToState(RegisterEvent event,) async* {
    if (event is EmailChanged) {
      yield* _mapEmailChangedToState(event.email);
    }
    if (event is PasswordChanged) {
      yield* _mapPasswordChangedToState(event.password);
    }
    if (event is Submitted) {
      yield* _mapFormSubmittedToState(event.email, event.password, event.fullName);
    }
  }

  Stream<RegisterState> _mapEmailChangedToState(String email) async*{
    yield state.update(
      isEmailValid: Validators.isValidEmail(email)
    );
  }

  Stream<RegisterState> _mapPasswordChangedToState(String password) async*{
    yield state.update(
      isPasswordValid: Validators.isValidPassword(password)
    );
  }

  Stream<RegisterState> _mapFormSubmittedToState(
    String email, String password, String fullName
  ) async*{
    yield RegisterState.loading();
    try {
      await _userRepository.signUp(email, password, fullName);
      yield RegisterState.success();
    } catch (e) {
      print(e);
      yield RegisterState.failure();
    }
  }
}