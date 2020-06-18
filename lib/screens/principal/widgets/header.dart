import 'package:flutter/material.dart';
import 'package:freiyaflutter/blocs/authentication/authentication_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freiyaflutter/screens/home/widgets/user_image.dart';
import '../../../util/screen_properties.dart';

class Header extends StatelessWidget implements PreferredSizeWidget{

  @override
  Size get preferredSize => Size.fromHeight(450.h);

  final bool _tallerista;

  const Header({Key key, bool tallerista})
    :assert(tallerista != null),
    _tallerista = tallerista,
    super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: screenWidth,height: screenHeight,allowFontScaling: allowFontingScaling);
    return Container(
      decoration: BoxDecoration(image: DecorationImage(
        image: _tallerista?
          AssetImage("assets/images/bar1.jpeg")
          :AssetImage("assets/images/bar2.jpeg"),
        fit: BoxFit.cover,
      )),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[          
          Expanded(
            flex: 2, 
            child: InkWell(
              onTap: ()=> Navigator.pop(context),
              child: Icon(Icons.arrow_back, color: Colors.white,)
            ),
          ),
          Expanded(
            flex: 6, 
            child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
              builder: (context, state) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    UserImage(urlImage: '${state.getPhotoUrl()}',),
                    Text('\n${state.getDisplayName()}',
                      style: TextStyle(
                        fontSize: 40.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                );
              },
            )
          ),
          Expanded(flex: 2, child: Container(),),
        ],
      ),
      
    );
  }

  
}