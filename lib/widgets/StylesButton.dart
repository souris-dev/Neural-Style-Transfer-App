import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StyleButton extends StatefulWidget {
  @override
  _StyleButtonState createState() => _StyleButtonState();
}

class _StyleButtonState extends State<StyleButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.h),
          topRight: Radius.circular(20.h),
        ),
        color: Color(0xFF1758AD),
      ),
      child: Center(
        child: Text(
          'STYLES',
          style: TextStyle(
            color: Colors.white,
            fontSize: 12.sp,
            letterSpacing: 1.2,
          ),
        ),
      ),
    );
  }
}
