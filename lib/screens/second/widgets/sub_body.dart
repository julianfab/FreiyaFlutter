import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:freiyaflutter/screens/StudentActivityQuestions/Student_ActicityQuestions_screen.dart';
import 'package:freiyaflutter/screens/create_activity/create_activity_screen.dart';
import 'package:freiyaflutter/screens/second/widgets/sub_card.dart';
import 'package:freiyaflutter/screens/use_activities/use_activities_screen.dart';

class SubBody extends StatelessWidget {

  final String _nameFunction;
  String _code;
  String _activityKey;

  SubBody({Key key, String nameFunciton})
    :assert(nameFunciton != null),
    _nameFunction = nameFunciton,
    super(key: key);

  Future<String> _asyncInputDialog(BuildContext context) async{
    return showDialog<String>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context){
        return AlertDialog(
          title: Text('Escribe el código de ingreso a la actividad'),
          content: Row(
            children: <Widget> [
              Expanded(
                child: TextField(
                autofocus: true,
                decoration: InputDecoration(
                    labelText: 'Código de ingreso', hintText: 'Escribe el código'),
                onChanged: (value) {
                  _code = value;
                },
              ))
            ]
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text('Unirse'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      }
    );
  }

  Future<void> codeVerification(String codeIn, String activityName) async{
    await FirebaseDatabase.instance
        .reference()
        .child("Activity")
        .child(activityName).once().asStream().forEach((DataSnapshot snapshot){
          Map map = snapshot.value;
          map.forEach((key,value){
            Map map2 = value;
            String accessCode = map2['accessCode'] as String;
            if (_code == accessCode){
              print('Encontro');
              _activityKey = key as String;
              print(_activityKey);
            }
          });
        });
  }

  Future<void> _pushScreen({BuildContext context, String action, String activityName}) async {
    switch (action) {
      case 'Crear':
        Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => CreateActivityScreen(activity: activityName,)),
        );
        break;
      case 'Usar':
        Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => UseActivitiesScreen(activity: activityName,)),
        );
        break;
      case 'Unirse':
        await _asyncInputDialog(context);
        await codeVerification(_code, 'ActivityQuestions');
        if(_activityKey == null){
          print(_activityKey);
          Scaffold.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(
            SnackBar(
              content: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Código de acceso Incorrecto'),
                  Icon(Icons.error)
                ],
              ),
              backgroundColor: Colors.yellow[700],
            )
          );
        } else {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => StudentActivityQuestionsSecreen(activityKey: _activityKey)),
        );
        }
        break;
      default:
    }
  }
  

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      child: Column(
        children: <Widget>[
          SubCard(
            title: 'Carrera QR',
            nameButton: _nameFunction,
            assetImage: 'assets/images/foto.png',
            onPressed: null,
          ),
          SubCard(
            title: 'Preguntas',
            nameButton: _nameFunction,
            assetImage: 'assets/images/foto.png',
            onPressed: (){
              _pushScreen(context: context, action: _nameFunction, activityName:'Preguntas');
            },
          ),
          SubCard(
            title: 'Retos',
            nameButton: _nameFunction,
            assetImage: 'assets/images/foto.png',
            onPressed: null,
          ),
        ],
      ),
    );

  
  

  }
}



/*



*/