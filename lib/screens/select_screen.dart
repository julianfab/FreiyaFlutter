import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SelectScreenState();
}

class _SelectScreenState extends State<SelectScreen> {
  

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

   
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/fondo1.jpeg"),
                  fit: BoxFit.cover)),
          padding: EdgeInsets.symmetric(
              horizontal: ScreenUtil().setWidth(40.0)),
          child: Column(
            children: <Widget>[
              Expanded(
                child: Text(""),
                flex: 5,
              ),
              Expanded(
                flex: 3,
                  child: ListView(
                children: <Widget>[
                  FlatButton(
                    color: Colors.white,
                    textColor: Colors.black,
                    disabledColor: Colors.grey,
                    disabledTextColor: Colors.black,
                    padding: EdgeInsets.all(8.0),
                    splashColor: Colors.white70,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed('tallerista');
                      /*Navigator.of(context).pushReplacement(MaterialScreenRoute(
                          builder: (context) => TalleristaScreen()));*/
                    },
                    child: Text(
                      "TALLERISTA",
                      style: TextStyle(fontSize: ScreenUtil().setSp(26.0)),
                    ),
                  ),
                  FlatButton(
                    color: Colors.white,
                    textColor: Colors.black,
                    disabledColor: Colors.grey,
                    disabledTextColor: Colors.black,
                    padding: EdgeInsets.all(8.0),
                    splashColor: Colors.white70,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    onPressed: () {
                      /*...*/
                    },
                    child: Text(
                      "ESTUDIANTE",
                      style: TextStyle(fontSize: ScreenUtil().setSp(26.0)),
                    ),
                  ),
                  RaisedButton.icon(
                    icon: Icon(Icons.exit_to_app),
                    label: Text('Cerrar Sesión', style: TextStyle(fontSize: ScreenUtil().setSp(26.0)),),
                    color: Colors.white,
                    textColor: Colors.black,
                    disabledColor: Colors.grey,
                    disabledTextColor: Colors.black,
                    splashColor: Colors.white70,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    onPressed: (){},
                  ),
                ],
              ), ),
              Expanded(child: Text(""), flex: 2,)
            ],
          )),
    );
  }
}
/*
class TalleristaScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TalleristaScreenState();
}

class _TalleristaScreenState extends State<TalleristaScreen> {
  @override
  Widget build(BuildContext context) {
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
                  preferredSize: Size(null, ScreenUtil().setSp(202.0)),
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
                                Image.asset('assets/images/cactividades.jpeg',width:ScreenUtil().setSp(140.0), height:ScreenUtil().setSp(140.0),),
                                Text("Crear \nActividades", textAlign: TextAlign.center,)
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
                                Image.asset('assets/images/uactividades.jpeg',width:ScreenUtil().setSp(140.0), height:ScreenUtil().setSp(140.0),),
                                Text("Usar \nActividades", textAlign: TextAlign.center,)
                              ],
                            ),
                          )
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
                                  Image.asset('assets/images/insignias.jpeg',width:ScreenUtil().setSp(140.0), height:ScreenUtil().setSp(140.0),),
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
                                Image.asset('assets/images/reportes.jpeg',width:ScreenUtil().setSp(140.0), height:ScreenUtil().setSp(140.0),),
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
*/