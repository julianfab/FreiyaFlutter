import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:freiyaflutter/blocs/authentication/authentication_bloc.dart';
import 'package:freiyaflutter/screens/second/widgets/sub_header.dart';
import 'package:freiyaflutter/util/screen_properties.dart';
import 'package:flutter_bloc/flutter_bloc.dart';




class CreateActivityScreen extends StatefulWidget {
  final String _activity;

  CreateActivityScreen({Key key, String activity})
    :assert(activity !=null),
    _activity = activity,
    super(key : key);

  @override
  _CreateActivityScreenState createState() => _CreateActivityScreenState();
}

class _CreateActivityScreenState extends State<CreateActivityScreen> {
  final DatabaseReference dBRef = FirebaseDatabase.instance.reference();

  String _activityName;

  @override
  Widget build(BuildContext context) {

    final authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);
    ScreenUtil.init(context, width: screenWidth,height: screenHeight,allowFontScaling: allowFontingScaling);

    RaisedButton _createActivityButton = RaisedButton(
                    child: Text('CREAR ACTIVIDAD',
                      style: TextStyle(fontSize: 30.sp),
                    ),
                    color: Colors.deepPurple,
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    ),
                    onPressed: _activityName == null ? null :(){
                      String keyRandom = dBRef.push().key;
                      //print('aqui fue'+_activityName);
                      dBRef.child('Activity').child('ActivityQuestions').child(keyRandom).set({
                        'creator':authenticationBloc.state.getUid(),
                        'elected':'',
                        'accessCode':'',
                        'activityName':_activityName,
                        'participants':[], 
                      });
                      authenticationBloc.close();
                      _activityName=null;
                      Navigator.of(context)..pop()..pop();
                    }
                  );

    return SafeArea(
      bottom: false,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: SubHeader(title: 'Crear',),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: _createActivityButton,
        body: Container(
          padding: EdgeInsets.symmetric(horizontal:30.0, vertical: 20.0),
          child: SingleChildScrollView(
            child: 
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    widget._activity,
                    style: TextStyle(
                      color: Colors.deepPurple,
                      fontSize: 80.sp,
                    ),
                  ),
                  Divider(thickness: 3.0, color: Colors.deepPurpleAccent,),
                  SizedBox(height: 30.h,),
                  Text(
                    'Escribe el nombre de la actividad : ',
                    style: TextStyle(
                      fontSize:40.sp,
                    ),
                  ),
                  SizedBox(height: 30.h,),
                  TextField(
                    autofocus: false,
                    decoration: InputDecoration(
                      labelText: 'Nombre de la Actividad', hintText: 'Ingresa el nombre de la actividad',
                      border: OutlineInputBorder(),
                      //border: InputBorder.none,
                    ),
                    onChanged: (value){                      
                      _activityName = value;
                    },
                  ),
                  SizedBox(height: 50.h,),
                  
                  Text(
                    'Descripción de la actividad:',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 40.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,
                      
                    ),
                  ),
                  Divider(thickness: 3.0, color: Colors.deepPurpleAccent,),
                  SizedBox(height: 50.h,),
                  Text(
                    'En construcción...',
                    style: TextStyle(
                      fontSize: 50.sp,
                    ),
                  ),
                  SizedBox(height: 100.h,),
                  
                  
                ]
              ),
            
          ),
        ),

      )
    );

    

  }

  
}