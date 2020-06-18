import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:freiyaflutter/screens/home/widgets/scanner_button.dart';
//import 'package:freiyaflutter/screens/home/widgets/user_image.dart';
import 'package:freiyaflutter/screens/home/widgets/user_type_button.dart';
import '../../blocs/authentication/authentication_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeScreen extends StatelessWidget {
  final FirebaseUser _firebaseUser;

  HomeScreen({Key key, @required FirebaseUser firebaseUser})
   : assert(firebaseUser != null),
   _firebaseUser =firebaseUser,
   super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        fit:StackFit.expand,
        alignment: AlignmentDirectional.center,
        children: <Widget>[
          Image.asset("assets/images/fondo1.jpeg", fit: BoxFit.cover,),
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              actions: <Widget>[
                FlatButton(
                  onPressed: () {BlocProvider.of<AuthenticationBloc>(context).add(LoggedOut());                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.exit_to_app, color: Colors.white,),
                      Text('Cerrar Sesión', style: TextStyle(color: Colors.white),),
                    ]
                  )
                )
              ],
            ),
            body: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  //UserImage(urlImage: '${_firebaseUser.photoUrl}'),
                  Text(
                    'Hola! ${_firebaseUser.displayName}\nSelecciona tu tipo de usuario',
                    textScaleFactor: 1.5,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  UserTypeButton(name: 'Tallerista',),
                  UserTypeButton(name: 'Estudiante',),
                  //ScannerButton(uidIn:_firebaseUser.uid),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}