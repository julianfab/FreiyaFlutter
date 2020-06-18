import 'package:flutter/material.dart';
import 'package:freiyaflutter/util/screen_properties.dart';

class SubCard extends StatelessWidget {

  final String _assetImage;
  final String _title;
  final VoidCallback _onPressed;
  final String _nameButton;

  const SubCard(
      {Key key,
      String assetImage,
      String title,
      VoidCallback onPressed,
      String nameButton})
      : assert(assetImage != null),
        _assetImage = assetImage,
        _title = title,
        _onPressed = onPressed,
        _nameButton = nameButton,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: screenWidth,height: screenHeight,allowFontScaling: allowFontingScaling);
    return Card(
        borderOnForeground: true,
        elevation: 6.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(child: Image.asset(_assetImage, width: 290.w, height: 290.h,), flex:5,),
              Expanded(
                flex: 5,
                child: Column(
                  children: <Widget>[
                    Text(
                      _title,
                      textAlign: TextAlign.center,
                    ),
                    RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        color: Colors.deepPurple,
                        onPressed: _onPressed,
                        child: Text(
                          _nameButton,
                          style: TextStyle(
                            color: Colors.white60,
                          ),
                        ),
                    )
                  ],
                ),
              ),              
            ],
          ),
        ));
  }

  
}
