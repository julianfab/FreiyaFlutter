import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freiyaflutter/blocs/login/login_bloc.dart';
import 'package:freiyaflutter/repositories/user_repository.dart';
import 'package:freiyaflutter/screens/login/widgets/login_form.dart';
import '../../util/screen_properties.dart';

class LoginScreen extends StatelessWidget {

  final UserRepository _userRepository;

  LoginScreen({Key key, @required UserRepository userRepository})
    :assert(userRepository != null),
    _userRepository =userRepository,
    super(key : key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: screenWidth,height: screenHeight,allowFontScaling: allowFontingScaling);
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      body: BlocProvider<LoginBloc>(
        create: (context) => LoginBloc(userRepository: _userRepository),
        child: Container(
          padding: EdgeInsets.only(top: 500.h, left: 3.0.w, right: 3.0.w,),
          decoration: BoxDecoration(image: DecorationImage(
            image: AssetImage("assets/images/fondo1.jpeg"),
            fit: BoxFit.cover
          )),
          child: ListView(
            children: [
              LoginForm(userRepository: _userRepository,)
            ]
          ),
        ),
      ),
    );
  }
}

