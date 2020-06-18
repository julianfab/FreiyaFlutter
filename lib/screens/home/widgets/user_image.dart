import 'package:flutter/material.dart';

class UserImage extends StatelessWidget {
  final String _urlImage;

  UserImage({Key key, String urlImage})
      : _urlImage = urlImage,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          shape: BoxShape.circle,
          image: DecorationImage(
              fit: BoxFit.fill,
              image: _image(),
          )
      ),
    );
  }

  _image () {
    if (_urlImage != "null"){ 
      if(_urlImage[_urlImage.length-1] == 'e'){
        return NetworkImage(_urlImage+"?height=500&width=500");
      } else {
        return NetworkImage(_urlImage);
      }    
      
    } else {
      return AssetImage("assets/images/unnamed.png",);
    }
  }
}
