//import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
//import 'package:freiyaflutter/blocs/authentication/authentication_bloc.dart';
import 'package:freiyaflutter/screens/second/widgets/sub_header.dart';
import 'package:freiyaflutter/screens/use_activities/widgets/my_activities.dart';
import 'package:freiyaflutter/util/screen_properties.dart';
//import 'package:flutter_bloc/flutter_bloc.dart';

class UseActivitiesScreen extends StatefulWidget {
  final String _activity;
  

  UseActivitiesScreen({Key key, String activity})
      : assert(activity != null),
        _activity = activity,
        super(key: key);

  @override
  _UseActivitiesScreenState createState() => _UseActivitiesScreenState();
}

class _UseActivitiesScreenState extends State<UseActivitiesScreen> {
  int _currentIndex = 0;
  
  
  @override
  Widget build(BuildContext context) {

    List<Widget> _bodys = [
      MyActivities(activity: widget._activity,),
      MyActivities(activity: widget._activity,),
    ];

    ScreenUtil.init(context,
        width: screenWidth,
        height: screenHeight,
        allowFontScaling: allowFontingScaling);

    return SafeArea(
      bottom: false,
      child: Scaffold(
        appBar: SubHeader(title: widget._activity),
        body: _bodys[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          fixedColor: Colors.deepPurple,
          onTap: onTapTapped,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(title: Text('Mis Actividades'), icon: Icon(Icons.filter_list)),
            BottomNavigationBarItem(
                title: Text('Todas las Actividades'), icon: Icon(Icons.format_list_bulleted)),
          ],
        ),
      ),
    );
  }

  void onTapTapped(int value) {
    setState(() {
      _currentIndex = value;
    });
  }
}
