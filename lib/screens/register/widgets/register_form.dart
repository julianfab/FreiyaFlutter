import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freiyaflutter/blocs/authentication/authentication_bloc.dart';
import 'package:freiyaflutter/blocs/register/register_bloc.dart';
import 'package:freiyaflutter/screens/register/widgets/register_button.dart';
import 'package:freiyaflutter/util/screen_properties.dart';


class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();

  RegisterBloc _registerBloc;

  bool get isPopulated =>
      _emailController.text.isNotEmpty && _passwordController.text.isNotEmpty && _fullNameController.text.isNotEmpty;
  
  bool isRegisterButtonEnabled(RegisterState state) {
    return state.isFormValid && isPopulated && !state.isSubmitting;
  }

  @override
  void initState() {
    super.initState();
    _registerBloc = BlocProvider.of<RegisterBloc>(context);
    _emailController.addListener(_onEmailChanged);
    _passwordController.addListener(_onPasswordChanged);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: screenWidth,height: screenHeight,allowFontScaling: allowFontingScaling);
    return BlocListener<RegisterBloc, RegisterState>(
      listener: (context, state) {
        if (state.isSubmitting) {
          Scaffold.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Registrando'),
                    CircularProgressIndicator()
                  ],
                ),
              )
            );
        }
        if (state.isSuccess) {
          BlocProvider.of<AuthenticationBloc>(context)
            .add(LoggedIn());
          Navigator.of(context).pop();
        }
        if (state.isFailure) {
          Scaffold.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(
            SnackBar(
              content: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Fallo Registro'),
                  Icon(Icons.error)
                ],
              ),
              backgroundColor: Colors.red,
            )
          );
        }
      },
      child: BlocBuilder<RegisterBloc, RegisterState>(
        builder: (context, state) {
          return Form(
              child: ListView(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(20.0),
                    height: 620.h,
                    margin: EdgeInsets.only(top:50.0, left:20.0, bottom:0.0, right:20.0),
                    alignment: Alignment.topCenter,
                    child: Column(
                        children: <Widget>[
                          TextFormField(
                            controller: _fullNameController,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              icon: Icon(Icons.person,color: Colors.white,),
                              labelText: 'Ingresa tu nombre completo',
                              labelStyle: TextStyle(color: Colors.white),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white)),
                            ),
                            keyboardType: TextInputType.text,
                            autocorrect: false,
                            autovalidate: false,
                            validator: (_){
                              return !_fullNameController.text.isNotEmpty? 'Este campo no puede estar vacio' : null;
                            },
                          ),
                          TextFormField(
                            controller: _emailController,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              icon: Icon(Icons.email,color: Colors.white,),
                              labelText: 'Ingresa tu email',
                              labelStyle: TextStyle(color: Colors.white),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white)),
                            ),
                            keyboardType: TextInputType.emailAddress,
                            autocorrect: false,
                            autovalidate: true,
                            validator: (_){
                              return !state.isEmailValid? 'Email Invalido' : null;
                            },
                          ),
                          TextFormField(
                            controller: _passwordController,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              icon: Icon(Icons.lock,color: Colors.white,),
                              labelText: 'Ingresa tu Contraseña',
                              labelStyle: TextStyle(color: Colors.white),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white)),
                            ),
                            obscureText: true,
                            autocorrect: false,
                            autovalidate: true,
                            validator: (_){
                              return !state.isPasswordValid ? 'Contraseña Incorrecta': null;
                            },
                          ),
                        ],
                      ),
                  ),
                  // Un button
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal:20.0),
                    child: RegisterButton(
                      onPressed: isRegisterButtonEnabled(state)
                        ? _onFormSubmitted
                        : null,
                    ),
                  )
                ],
              ),
            );
        },
      )
    );
  }

  void _onEmailChanged() {
    _registerBloc.add(
      EmailChanged(email: _emailController.text)
    );
  }

  void _onPasswordChanged() {
    _registerBloc.add(
      PasswordChanged(password: _passwordController.text)
    );
  }

  void _onFormSubmitted() {
    _registerBloc.add(
      Submitted(
        email: _emailController.text,
        password: _passwordController.text,
        fullName: _fullNameController.text,
      )
    );
  }
}