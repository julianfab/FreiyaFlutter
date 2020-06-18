import 'package:flutter/material.dart';
import 'package:freiyaflutter/screens/principal/widgets/card_button.dart';
import 'package:freiyaflutter/screens/second/second_screen.dart';

class Body extends StatelessWidget {

  final bool _tallerista;

  const Body({Key key, bool tallerista})
    :assert(tallerista != null),
    _tallerista = tallerista,
    super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CardButton(
                assetImage: _tallerista ? 'assets/images/cactividades.jpeg' : 'assets/images/uactividades.jpeg',
                textCard: _tallerista ? 'Crear \nActividades' : 'Perfil del\nEstudiante',
                onPressed: (){
                  if(_tallerista){
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => SecondScreen(idIn:0)),
                    );
                  }                  
                },
              ),
              CardButton(
                assetImage: _tallerista ? 'assets/images/uactividades.jpeg' : 'assets/images/cactividades.jpeg',
                textCard: _tallerista ? 'Usar \nActividades' : 'Unirse a \nActividad',
                onPressed: (){
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => SecondScreen(idIn: _tallerista ? 1 : 3,)),
                  );
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CardButton(
                assetImage: _tallerista ? 'assets/images/insignias.jpeg' : 'assets/images/insignias.jpeg',
                textCard: _tallerista ? 'Insignias' : 'Herramientas',
                onPressed: null,
              ),
              CardButton(
                assetImage: _tallerista ? 'assets/images/reportes.jpeg' : 'assets/images/insignias.jpeg',
                textCard: _tallerista ? 'Reportes' : 'Tableros de \nLideres',
                onPressed: null,
              ),
            ],
          ),
        ],
      ),
    );
  }
}