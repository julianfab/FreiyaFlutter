import 'package:flutter/material.dart';
//import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../blocs/login/login_bloc.dart';

class FacebookLoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: "FacebookButton",
      backgroundColor: Color(0xff3b5998),
      child: Icon(FontAwesomeIcons.facebook,),
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
        BlocProvider.of<LoginBloc>(context).add(LoginWithFacebookPressed());
      },
    );
  }
}