import 'package:flutter/material.dart';
import '../../../util/screen_properties.dart';

class SubHeader extends StatelessWidget implements PreferredSizeWidget {
  final String _title;

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  const SubHeader({
    Key key,
    String title,
  })  : assert(title !=null),
        _title = title,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: screenWidth,height: screenHeight,allowFontScaling: allowFontingScaling);
    return Container(
      width: double.infinity,
      color: Colors.deepPurple,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: InkWell(
              onTap: () => Navigator.pop(context),
              child: Icon(
                Icons.arrow_back,
                color: Colors.white,
            )),
          ),
          Expanded(
            flex: 6,
            child: Container(
              alignment: Alignment.center,
              child: Text(
                _title+' Actividad',
                style: TextStyle(
                  fontSize: 35.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ),
          Expanded(flex: 2, child: Container(),),
        ],
      ),
    );
  }
}
