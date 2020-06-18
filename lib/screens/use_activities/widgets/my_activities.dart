import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:freiyaflutter/screens/questions/questions_screen.dart';
import 'package:freiyaflutter/screens/use_activities/widgets/activity_button.dart';
import 'package:freiyaflutter/util/screen_properties.dart';

class MyActivities extends StatefulWidget {

  final String _activity;

  MyActivities({Key key, String activity})
    : assert(activity != null),
      _activity = activity,
      super(key: key);

  @override
  _MyActivitiesState createState() => _MyActivitiesState();
}

class _MyActivitiesState extends State<MyActivities> {
  final DatabaseReference dBRef = FirebaseDatabase.instance.reference();
  Query _query;

  @override
  void initState() {
    queryActivities(widget._activity).then((Query query){
      setState((){
        _query = query;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: screenWidth,height: screenHeight,allowFontScaling: allowFontingScaling);
    Widget listActivities = ListView(
      shrinkWrap: true,
      children: <Widget>[
        ListTile(title: Text('No hay actividades Creadas'),),
      ],
    );

    if(_query != null){
      
      listActivities = Expanded(
        child: FirebaseAnimatedList(
          query: _query, 
          itemBuilder: (
            BuildContext context,
            DataSnapshot snapshot,
            Animation<double> animation,
            int index,
          ){
            Map map = snapshot.value;
            String activityKey = snapshot.key;
            String activityName = map['activityName'] as String;
            return Column(
              children: <Widget>[
                ActivityButton(
                  nameActivity: activityName,
                  onPressed: (){
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => QuestionsScreen(activityName: activityName, activityKey: activityKey,)),
                    );
                  }
                ),
              ],
            );
          }
        )
      );
    }

    return Padding(
      padding: EdgeInsets.all(25.0),
      child: Column(
        children: [
          Text(
            'Seleccione una Actividad:\n',
            style: TextStyle(
              fontSize: 40.sp,
            ),
          ),
          listActivities,
        ]
      ),
    );
  }

  static Future<Query> queryActivities(String activity) async {
    String _activity;
    switch (activity) {
      case 'Preguntas':
        _activity = 'ActivityQuestions';
        break;
      default:
    }

    return FirebaseDatabase.instance
        .reference()
        .child("Activity")
        .child(_activity).orderByKey();
  }
}