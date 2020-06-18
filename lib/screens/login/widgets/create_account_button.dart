import 'package:flutter/material.dart';
import 'package:freiyaflutter/screens/register/register_screen.dart';
import '../../../repositories/user_repository.dart';

class CreateAccountButton extends StatelessWidget {

  final UserRepository _userRepository;

  CreateAccountButton({Key key, UserRepository userRepository})
    :assert(userRepository !=null),
    _userRepository =userRepository,
    super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Text(
        'Crea una Cuenta',
        style: TextStyle(
          color: Colors.white,
          decoration: TextDecoration.underline,
        ),
      ),
      onPressed: (){
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context){
            return RegisterScreen(userRepository:_userRepository);
            //return Container(color: Colors.blue,);}
            //return Scaffold();
          })
        );
      },
    );
  }
}