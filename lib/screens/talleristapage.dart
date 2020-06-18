import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class TalleristaPage extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    double defaultScreenWidth = 540.0;
    double defaultScreenHeight = 960.0;

    ScreenUtil.init(
      context,
      width: defaultScreenWidth,
      height: defaultScreenHeight,
      allowFontScaling: true,
    );
    return Container(
      child: Stack(
        children: <Widget>[
          Container(
            child: Image.asset('assets/images/bar1.jpeg'),
            color: Colors.lightGreen,
          ),
          Scaffold(
              appBar: AppBar(
                //title: new Text('Hello'),
                backgroundColor: Colors.transparent,
                elevation: 0.0,
                bottom: PreferredSize(
                  preferredSize: Size(null, ScreenUtil().setWidth(202.0)),
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: ScreenUtil().setHeight(170.0),
                        width: ScreenUtil().setWidth(170.0),
                        child: null,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage("assets/images/foto.png"),
                              fit: BoxFit.fill,
                            )),
                      ),
                      Padding(
                          padding: EdgeInsets.only(bottom: ScreenUtil().setSp(20.0), top: ScreenUtil().setSp(10.0)),
                          child: Text("NOMBRE DE USUARIO", style: TextStyle(
                            fontSize: ScreenUtil().setSp(26.0),
                            color: Colors.white,
                            fontStyle: FontStyle.italic,
                          ),)
                      )
                    ],
                  ),
                ),
              ),
              backgroundColor: Colors.transparent,
              body: Container(
                  color: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setSp(20.0), vertical: ScreenUtil().setSp(20.0)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Card(
                              borderOnForeground: true,
                              elevation: 6.0,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0)),),
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical:ScreenUtil().setSp(10.0), horizontal: ScreenUtil().setSp(30.0) ),
                                child: Column(
                                  children: <Widget>[
                                    Image.asset('assets/images/cactividades.jpeg',width:ScreenUtil().setWidth(140.0), height:ScreenUtil().setHeight(140.0),),
                                    Text("Crear \nActividades", textAlign: TextAlign.center,)
                                  ],
                                ),
                              )
                          ),
                          InkWell(
                            onTap: (){Navigator.of(context).pushNamed('actividades');},
                            child: Card(
                                borderOnForeground: true,
                                elevation: 6.0,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0)),),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical:ScreenUtil().setSp(10.0), horizontal: ScreenUtil().setSp(30.0) ),
                                  child: Column(
                                    children: <Widget>[
                                      Image.asset('assets/images/uactividades.jpeg',width:ScreenUtil().setWidth(140.0), height:ScreenUtil().setHeight(140.0),),
                                      Text("Usar \nActividades", textAlign: TextAlign.center,)
                                    ],
                                  ),
                                )
                            ),
                          )
                        ],
                      ),
                      Text(""),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Card(
                              borderOnForeground: true,
                              elevation: 6.0,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0)),),
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical:ScreenUtil().setSp(10.0), horizontal: ScreenUtil().setSp(30.0) ),
                                child: Column(
                                  children: <Widget>[
                                    Image.asset('assets/images/insignias.jpeg',width:ScreenUtil().setWidth(140.0), height:ScreenUtil().setHeight(140.0),),
                                    Text("Insignias", textAlign: TextAlign.center,)
                                  ],
                                ),
                              )
                          ),
                          Card(
                              borderOnForeground: true,
                              elevation: 6.0,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0)),),
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical:ScreenUtil().setSp(10.0), horizontal: ScreenUtil().setSp(30.0) ),
                                child: Column(
                                  children: <Widget>[
                                    Image.asset('assets/images/reportes.jpeg',width:ScreenUtil().setWidth(140.0), height:ScreenUtil().setHeight(140.0),),
                                    Text("Reportes", textAlign: TextAlign.center,)
                                  ],
                                ),
                              )
                          )
                        ],
                      )
                    ],
                  )
              ))
        ],
      ),
    );
  }
}
