import 'package:flutter/material.dart';
import '../stores/Stores.dart';
import '../utils/DBUtils.dart';
import '../utils/StyleOptions.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StyleOptionsPreview extends StatefulWidget {
  @override
  _StyleOptionsPreviewState createState() => _StyleOptionsPreviewState();
}

class _StyleOptionsPreviewState extends State<StyleOptionsPreview> {
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        var unlockedStyles = DBUtils.getUnlockedStyles();
        return AnimatedContainer(
          curve: Curves.easeIn,
          duration: Duration(milliseconds: 150),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(21.w), border: Border.all(color: Color(0xFF342DEF))),
          child: Column(
            children: <Widget>[
              Container(),
              Container(
                child: FutureBuilder<List<StyleOption>>(
                  future: unlockedStyles,
                  builder: (context, AsyncSnapshot<List<StyleOption>> snapshot) {
                    if (!snapshot.hasData) {
                      return Image.asset(snapshot.data[Stores.styleOptStr.currentSelectedStyleOptionIndex].assetName);
                    } else {
                      return CircularProgressIndicator();
                    }
                  },
                ),
              ),
              Container(
                child: Row(
                  children: <Widget>[
                    Container(
                      child: GestureDetector(
                        child: Image.asset("assets/images/raster/StyleUseBtn.png"),
                        onTap: () {
                          Stores.styleOptionsStore.closeStyleOptions();
                        },
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

class StyleOptionsBar extends StatefulWidget {
  @override
  _StyleOptionsBarState createState() => _StyleOptionsBarState();
}

class _StyleOptionsBarState extends State<StyleOptionsBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.h,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.fromBorderSide(
          BorderSide(
            color: Color(0xFFF3F3F3),
          ),
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(17.w),
          topRight: Radius.circular(17.w),
        ),
        boxShadow: <BoxShadow>[
          BoxShadow(
            blurRadius: 6,
            offset: Offset(0, -2),
            color: Color(0x66D9CAFE),
          ),
        ],
      ),
      child: Row(
        children: <Widget>[
          Container(
            child: Image.asset(
              'assets/images/raster/StyleBarCloseBtn.png',
              height: 24.h,
              width: 29.w,
            ),
          ),
          Expanded(
            child: Container(
              child: Placeholder(),
              // ListWheelScrollView within RotatedBox
            ),
          ),
          Container(
            child: Image.asset(
              'assets/images/raster/StyleBarAddStyleBtn.png',
              height: 24.h,
              width: 29.w,
            ),
          ),
        ],
      ),
    );
  }
}

class StyleOptionsWidget extends StatefulWidget {
  @override
  _StyleOptionsWidgetState createState() => _StyleOptionsWidgetState();
}

class _StyleOptionsWidgetState extends State<StyleOptionsWidget> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
