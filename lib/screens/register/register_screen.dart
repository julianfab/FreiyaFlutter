import 'package:flutter/material.dart';
import 'package:freiyaflutter/blocs/register/register_bloc.dart';
import 'package:freiyaflutter/repositories/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freiyaflutter/screens/register/widgets/register_form.dart';
import 'package:freiyaflutter/util/screen_properties.dart';


class RegisterScreen extends StatelessWidget {
  final UserRepository _userRepository;
  

  RegisterScreen({Key key, @required UserRepository userRepository})
    :assert(userRepository != null),
    _userRepository = userRepository,
    super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: screenWidth,height: screenHeight,allowFontScaling: allowFontingScaling);
    return Container(
      child: Stack(
        fit: StackFit.expand,
        alignment: AlignmentDirectional.center,
        children: <Widget>[
          Image.asset("assets/images/fondo1.jpeg", fit: BoxFit.cover,),
          Scaffold(
            //resizeToAvoidBottomInset: false,
            backgroundColor: Colors.transparent,
            appBar: AppBar(backgroundColor: Colors.transparent, title: Text('Crea una cuenta'), centerTitle: true,),
            body: BlocProvider<RegisterBloc>(
              create: (context) => RegisterBloc(userRepository: _userRepository),
              child: Padding(
                padding: EdgeInsets.only(top: 240.h, left: 3.0.w, right: 3.0.w,),
                child: RegisterForm(),
              ),
            ),
          )
        ],
      ),
    );
  }
}