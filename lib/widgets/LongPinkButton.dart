import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LongPinkButton extends RaisedButton {
  LongPinkButton({Key key, this.text, this.onPress})
      : super(
          key: key,
          onPressed: onPress,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.h),
          ),
          color: Color(0xFFF01D7F),
          textColor: Colors.white,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.w),
            child: Text(
              text,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.7,
                wordSpacing: 1.45,
              ),
            ),
          ),
          elevation: 5,
          focusColor: Color(0xFFC7005D),
          highlightColor: Color(0xFFC7005D),
        );

  final String text;
  final Function onPress;
}
