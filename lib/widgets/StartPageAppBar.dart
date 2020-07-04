import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StartPageAppBar extends StatelessWidget {
  StartPageAppBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 155.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(17.h),
          bottomRight: Radius.circular(17.h),
        ),
        color: Color(0xFF130D1A),
        image: DecorationImage(
          image: AssetImage('assets/images/StartPageAppBarBg.jpg'),
          fit: BoxFit.fitWidth,
        ),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Color(0xFFD3CCE3),
            offset: Offset(0, 5),
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Center(
            child: Padding(
              padding: EdgeInsets.only(bottom: 16.h),
              child: Text(
                'Image Stylist',
                style: TextStyle(
                  fontFamily: 'InkFree',
                  fontSize: 30.sp,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
