import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:style_transfer_app/stores/Stores.dart';

class DAppBar extends StatefulWidget {
  DAppBar({Key key}) : super(key: key);

  //final SidePaneStore sidePaneState;

  @override
  _DAppBarState createState() => _DAppBarState();
}

class _DAppBarState extends State<DAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 49.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(17.h),
          bottomRight: Radius.circular(17.h),
        ),
        color: Color(0xFF130D1A),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Color(0xFFD3CCE3),
            offset: Offset(0, 4),
            blurRadius: 6,
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          GestureDetector(
            onTap: Stores.sidePaneStore.toggleSidePane,
            child: Container(
              // A transparent border for ease of tapping
              // Adding the border makes the container expand
              // properly to its intended size
              decoration: BoxDecoration(
                border: Border.all(color: Color(0x00000000), width: 0),
              ),
              padding: EdgeInsets.all(17.w),
              child: Observer(
                builder: (_) => Icon(
                  Icons.menu,
                  color: Color(
                    Stores.sidePaneStore.isSidePaneOpen ? 0xFF746FFF : 0xFFC7C5FF,
                  ),
                  size: 25.w,
                ),
              ),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment(-0.25, 0),
              child: Container(
                child: Text(
                  'Image Stylist',
                  style: TextStyle(
                    fontFamily: 'InkFree',
                    fontSize: 18.sp,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
