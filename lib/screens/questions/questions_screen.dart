import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:freiyaflutter/screens/use_activities/widgets/activity_button.dart';
import 'package:freiyaflutter/util/screen_properties.dart';
class QuestionsScreen extends StatefulWidget {

  final String _activityName;
  final String _activityKey;
  

  QuestionsScreen({Key key, String activityName, String activityKey})
    : assert(activityName != null, activityKey != null),
      _activityName = activityName,
      _activityKey = activityKey,
      super(key: key);

  @override
  _QuestionsScreenState createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  //StreamSubscription _subscriptionActivity;
  Query _queryList;
  Stream _choosenStream;
  String _accessCode = "";


  @override
  void initState() {
    print(widget._activityKey);
    getActivityStream(widget._activityKey).then((Query query){
      query.once().then((DataSnapshot snapshot){
        Map map = snapshot.value;
        //String elected = map['elected'] as String;
        String accessCode = map['accessCode'] as String;
        setState(() {
          _accessCode = accessCode;        
        });        
      });
      queryActivityStudents(widget._activityKey).then((Query query){
        setState((){
          _queryList = query;
        });
      });

      
    });
    print('aqui viene');
    super.initState();
  }

  @override
  void dispose() {
    //_subscriptionActivity.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    getElected(widget._activityKey).then((Stream streamIn){
        setState(() {
          _choosenStream = streamIn;
        });
    });
    Widget listStudents = ListView(
      shrinkWrap: true,
      children: <Widget>[
        Text('Aún no se han unido estudiantes a la actividad',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 40.sp, fontWeight: FontWeight.bold,),
        ),
      ]
    );


    if(_queryList!=null){
      listStudents = FirebaseAnimatedList(
        query: _queryList, 
        itemBuilder: (
          BuildContext context,
          DataSnapshot snapshot,
          Animation<double> animation,
          int index,
        ) {
          String name = snapshot.value;
          return Column(
            children: <Widget>[
              ActivityButton(
                nameActivity: name,
                onPressed: (){
                  chooseStudend(name, widget._activityKey);
                },
              ),
            ],
          );
        }
      );
    }

    return SafeArea(
      bottom: false,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget._activityName),
          backgroundColor: Colors.deepPurple,
          centerTitle: true,
        ),
        body: Column(
          children: [
            Expanded(
              flex: 5,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding: EdgeInsets.all(7.0),
                      margin: EdgeInsets.only(top:20.0, left:20.0, bottom:20.0, right:7.0),
                      alignment: Alignment.topCenter,
                      decoration: BoxDecoration(
                        //border: Border.all(width: 3,color: Colors.deepPurple.shade300),
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      child: Column(
                        //crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'Estado',
                            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.deepPurple, fontSize: 40.sp),
                          ),
                          Divider(thickness: 7.w, color: Colors.deepPurple,),
                          Text(
                            'Código de Ingreso a la Actividad:', 
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 28.sp,fontWeight: FontWeight.bold,),
                          ),
                          SizedBox(height: 5.h,),
                          Text(_accessCode, style: TextStyle(color: Colors.orange,fontSize: 50.sp),),
                          SizedBox(height: 5.h,),
                          Text(
                            'Estudiante Seleccionado:',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 28.sp,fontWeight: FontWeight.bold,),
                          ),
                          StreamBuilder(
                            stream: _choosenStream,
                            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot){
                              if(!snapshot.hasData || snapshot.data.value == ""){
                                return Text('No ha seleccionado un Estudiante',style: TextStyle(color: Colors.orange,fontSize: 30.sp),textAlign: TextAlign.center, );
                              }else{
                                return Text(snapshot.data.value, style: TextStyle(color: Colors.orange,fontSize: 30.sp),textAlign: TextAlign.center,);
                              }
                              
                            }
                          ),
                          //Text(_selectStudent == "" ? 'No ha seleccionado un Estudiante': _selectStudent,style: TextStyle(color: Colors.orange,fontSize: 30.sp),textAlign: TextAlign.center, )
                        ]
                      ),

                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding: EdgeInsets.all(7.0),
                      margin: EdgeInsets.only(top:20.0, left:7.0, bottom:20.0, right:20.0),
                      alignment: Alignment.topCenter,
                      decoration: BoxDecoration(
                        //border: Border.all(width: 3, color: Colors.deepPurple[300]),
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      child: Column(
                        //mainAxisAlignment: MainAxisAlignment.espacio,
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'Acciones',
                            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.deepPurple, fontSize: 40.sp),
                          ),
                          Divider(thickness: 7.w, color: Colors.deepPurple,),
                          FlatButton(
                            color: Colors.purple.shade800,
                            textColor: Colors.white,
                            child: Text('Comenzar Actividad', textAlign: TextAlign.center, style: TextStyle(fontSize: 30.sp),),
                            shape: StadiumBorder(),
                            onPressed: (){

                            }
                          ),
                          OutlineButton(
                            //color: Colors.purple.shade800,
                            textColor: Colors.purple,
                            child: Text('Terminar la Actividad', textAlign: TextAlign.center,style: TextStyle(fontSize: 30.sp),),
                            shape: StadiumBorder(),
                            onPressed: (){

                            }
                          ),
                        ]
                      ),

                    ),
                  ),
                ]
              ),
            ),
            Expanded(
              flex: 6,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 27.0),
                child: Column(
                  children: [
                    Text('Estudiantes unidos a la actividad:',
                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.deepPurple, fontSize: 40.sp),
                    ),
                    Divider(thickness: 7.w, color: Colors.deepPurple,),
                    SizedBox(
                      height: 600.h,
                      child: listStudents,
                    ),
                    /*Text('Aún no se han unido estudiantes a la actividad',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 40.sp, fontWeight: FontWeight.bold,),
                    ),*/
                  ]
                )
              )
            ),
            
          ]
        ),
        
      ),
    );
  }

  static Future<Query> getActivityStream(String activityKey) async {
    return FirebaseDatabase.instance
      .reference()
      .child("Activity")
      .child("ActivityQuestions")
      .child(activityKey);
  } 

  static Future<Query> queryActivityStudents(String activityKey) async {
    return FirebaseDatabase.instance
      .reference()
      .child("Activity")
      .child("ActivityQuestions")
      .child(activityKey)
      .child("participants");
  }

  static Future<Stream> getElected(String activityKey) async {
    Stream out = await FirebaseDatabase.instance
      .reference()
      .child("Activity")
      .child("ActivityQuestions")
      .child(activityKey)
      .child("elected").once().asStream();
    return out;
  }

  static Future<void> chooseStudend(String studentName, activityKey) async{
    await FirebaseDatabase.instance
      .reference()
      .child("Activity")
      .child("ActivityQuestions")
      .child(activityKey)
      .child("elected")
      .set(studentName);
  }
}


