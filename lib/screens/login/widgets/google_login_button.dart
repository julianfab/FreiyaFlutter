import 'package:flutter/material.dart';
//import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../blocs/login/login_bloc.dart';

class GoogleLoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: "GoogleButton",
      backgroundColor: Colors.red[600],
      child: Icon(FontAwesomeIcons.google,),
      onPressed: (){
        Scaffold.of(context).showSnackBar(
          SnackBar(
            content: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Iniciando Sesión...'),
                CircularProgressIndicator(),
              ],
            )
          )
        );
        BlocProvider.of<LoginBloc>(context).add(LoginWithGooglePressed());
      },
    );
  }
}