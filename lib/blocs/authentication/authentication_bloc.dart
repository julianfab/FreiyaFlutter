import 'package:bloc/bloc.dart';
import 'authentication_event.dart';
import 'authentication_state.dart';

import '../../repositories/user_repository.dart';
import 'package:meta/meta.dart';

export 'authentication_event.dart';
export 'authentication_state.dart';


class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository _userRepository;

  AuthenticationBloc({@required UserRepository userRepository})
    :assert(userRepository != null), 
    _userRepository =userRepository;

  @override
  AuthenticationState get initialState => AuthenticationUninitialized();

  @override
  Stream<AuthenticationState> mapEventToState(AuthenticationEvent event,) async* {
    if (event is AppStarted) {
      yield* _mapAppStartedToState();
    } else if (event is LoggedIn) {
      yield* _mapLoggedInToState();
    } else if (event is LoggedOut) {
      yield* _mapLoggedOutToState();
    }
  }

  Stream<AuthenticationState> _mapAppStartedToState() async*{
    try {
      final isSignedIn = await _userRepository.isSignedIn();
      if (isSignedIn) {
        final user = await _userRepository.getFirebaseUser();
        yield AuthenticationAuthenticated(user);
      } else {
        yield AuthenticationUnauthenticated();
      } 
    } catch (_) {
      yield AuthenticationUnauthenticated();
    }
  }

  Stream<AuthenticationState> _mapLoggedInToState()async*{
    yield AuthenticationAuthenticated(await _userRepository.getFirebaseUser());
  }

  Stream<AuthenticationState> _mapLoggedOutToState() async*{
    yield AuthenticationUnauthenticated();
    _userRepository.signOut();
  }
}