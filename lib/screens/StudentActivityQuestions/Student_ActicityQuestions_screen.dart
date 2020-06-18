import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:freiyaflutter/blocs/authentication/authentication_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StudentActivityQuestionsSecreen extends StatefulWidget {
  final String _activityKey;

  StudentActivityQuestionsSecreen({Key key,String activityKey})
    : assert(activityKey != null),
      _activityKey = activityKey,
      super(key: key);
  @override
  _StudentActivityQuestionsSecreenState createState() => _StudentActivityQuestionsSecreenState();
}

class _StudentActivityQuestionsSecreenState extends State<StudentActivityQuestionsSecreen> {

  //final streamElected = new StreamController<DataSnapshot>();
  Stream<DataSnapshot> streamData;
  String _name;
  //String _uid;

  @override
  void initState() {
    addStudent(widget._activityKey, context);
    
    super.initState();
  }

  @override
  void dispose() { 
    //streamElected.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    queryElected(widget._activityKey).then((Stream streamOut){
      setState(() {
        streamData = streamOut;
      });
    });
    return Scaffold(
      body: Center(
        child: StreamBuilder(
          stream: streamData,
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            //Map map = snapshot.data.key;
            if(!snapshot.hasData){
              return CircularProgressIndicator();
            }
            if(snapshot.data.value == _name){
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Haz sido elegido!'),
                ],
              );
            } else {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Todavia no has sido elegido :c'),
                  //Text('Elegido'),
                  //Text(snapshot.data.key),
                  //Text(snapshot.data.value),
                ]
              );
            }
            
          },
          )
      ),
    );
  }
  Future<void> addStudent(String activityKey, BuildContext context) async {
    String uid = BlocProvider.of<AuthenticationBloc>(context).state.getUid();
    String name = BlocProvider.of<AuthenticationBloc>(context).state.getDisplayName();
    //_uid= uid;
    _name = name;
    await FirebaseDatabase.instance
      .reference()
      .child("Activity")
      .child("ActivityQuestions")
      .child(activityKey)
      .child("participants")
      .child(uid).set(name);
  }

  static Future<Stream> queryElected(String activityKey) async {
    Stream salida = FirebaseDatabase.instance
      .reference()
      .child("Activity")
      .child("ActivityQuestions")
      .child(activityKey)
      .child("elected").once().asStream();
    
    return salida;
  }
}