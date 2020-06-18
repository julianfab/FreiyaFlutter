import 'package:flutter/material.dart';
import 'package:freiyaflutter/util/screen_properties.dart';



class ActivityButton extends StatelessWidget {

  final String _nameActivity;
  final VoidCallback _onPressed;

  ActivityButton({Key key, String nameActivity, VoidCallback onPressed})
    : assert(nameActivity !=null),
      _nameActivity = nameActivity,
      _onPressed = onPressed,
      super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: screenWidth,height: screenHeight,allowFontScaling: allowFontingScaling);
    return InkWell(
      onTap: _onPressed,
      child: SizedBox(
        height: 160.h,
        child: Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('INICIAR', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),),
                  Text(_nameActivity),
                ],
              )
            ]
          ),
        )
      ),
    );
  }
}