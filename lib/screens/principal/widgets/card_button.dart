import 'package:flutter/material.dart';
import '../../../util/screen_properties.dart';

class CardButton extends StatelessWidget {
  final String _assetImage;
  final String _textCard;
  final VoidCallback _onPressed;

  const CardButton({Key key, String assetImage, String textCard, VoidCallback onPressed})
      : assert( assetImage != null),
        _assetImage = assetImage,
        _textCard = textCard,
        _onPressed = onPressed,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: screenWidth,height: screenHeight,allowFontScaling: allowFontingScaling);
    return InkWell(
      onTap: _onPressed,
      child: Card(
          borderOnForeground: true,
          elevation: 6.0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0)),),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
            child: Column(
              children: <Widget>[
                Image.asset( _assetImage, width: 240.w, height: 240.h,),
                Text(
                  _textCard,
                  textAlign: TextAlign.center,
                )
              ],
            ),
          )),
    );
  }
}
