import 'package:flutter/material.dart';
import 'package:freiyaflutter/screens/principal/estudiante_screen.dart';
import '../../principal/tallerista_screen.dart';
import '../../../util/screen_properties.dart';

class UserTypeButton extends StatelessWidget {
  final String _name;

  UserTypeButton({Key key, String name})
      : _name = name,
        super(key: key);

  void _pushScreen(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => isTallerista()),
    );
  }

  Widget isTallerista(){
    if (_name == 'Tallerista'){
      return TalleristaScreen();
    } else {
      return EstudianteScreen();
    }
     
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: screenWidth,height: screenHeight,allowFontScaling: allowFontingScaling);
    return FlatButton(
      color: Colors.white,
      textColor: Colors.black,
      disabledColor: Colors.white,
      disabledTextColor: Colors.black,
      //padding: EdgeInsets.all(8.0),
      splashColor: Colors.white70,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
      ),
      onPressed: (){_pushScreen(context);},
      child: Text(
        _name,
        style: TextStyle(fontSize: 40.sp),
      ),
    );
  }
}
