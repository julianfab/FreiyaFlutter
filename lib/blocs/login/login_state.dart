import 'package:meta/meta.dart';

class LoginState {
  
  final bool isEmailValid;
  final bool isPasswordValid;
  final bool isSubmiting;
  final bool isSuccess;
  final bool isFailure;

  bool get isFormValid => isEmailValid && isPasswordValid;

  LoginState({
    @required this.isEmailValid, 
    @required this.isPasswordValid, 
    @required this.isSubmiting,
    @required this.isSuccess,
    @required this.isFailure,
  });

  factory LoginState.empty(){
    return LoginState(
      isEmailValid: true,
      isPasswordValid: true,
      isSubmiting: false,
      isSuccess: false,
      isFailure: false,
    );
  }

  factory LoginState.loading(){
    return LoginState(
      isEmailValid: true,
      isPasswordValid: true,
      isSubmiting: true,
      isSuccess: false,
      isFailure: false,
    );
  }

  factory LoginState.failure(){
    return LoginState(
      isEmailValid: true,
      isPasswordValid: true,
      isSubmiting: false,
      isSuccess: false,
      isFailure: true,
    );
  }

  factory LoginState.success(){
    return LoginState(
      isEmailValid: true,
      isPasswordValid: true,
      isSubmiting: false,
      isSuccess: true,
      isFailure: false,
    );
  }

  LoginState copyWith({
    bool isEmailValid,
    bool isPasswordValid,
    bool isSubmiting,
    bool isSuccess,
    bool isFailure,
  }){
    return LoginState(
      isEmailValid: isEmailValid ?? this.isEmailValid,
      isPasswordValid: isPasswordValid ?? this.isPasswordValid,
      isSubmiting: isSubmiting ?? this.isSubmiting,
      isSuccess: isSuccess ?? this.isSuccess,
      isFailure: isFailure ?? this.isFailure,
    );
  }

  LoginState update({bool isEmailValid, bool isPasswordValid}) {
    return copyWith(
        isEmailValid: isEmailValid,
        isPasswordValid: isPasswordValid,
        isSubmiting: false,
        isSuccess: false,
        isFailure: false);
  }
  
  @override
  String toString() {
  return ''' LoginState {
    isEmailValid: $isEmailValid,
    isPasswordValid: $isPasswordValid,
    isSubmiting: $isSubmiting,
    isSuccess: $isSuccess,
    isFailure: $isFailure,
    }''';
   }
}