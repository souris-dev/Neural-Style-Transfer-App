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
              Container(
                height: 22.w, // the w is not a typo
                child: Center(
                  child: FutureBuilder<List<StyleOption>>(
                    future: unlockedStyles,
                    builder: (BuildContext context, AsyncSnapshot<List<StyleOption>> snapshot) {
                      if (!snapshot.hasData) {
                        return Wrap(
                          children: <Widget>[
                            Text(
                              'By ' + snapshot.data[Stores.styleOptStr.currentSelectedStyleOptionIndex].createdBy,
                              style: TextStyle(
                                color: Color(0xFFEF0773),
                                fontSize: 12.sp,
                              ),
                            ),
                          ],
                        );
                      } else {
                        return Container();
                      }
                    },
                  ),
                ),
              ),
              Container(
                child: FutureBuilder<List<StyleOption>>(
                  future: unlockedStyles,
                  builder: (context, AsyncSnapshot<List<StyleOption>> snapshot) {
                    if (!snapshot.hasData) {
                      return snapshot.data[Stores.styleOptStr.currentSelectedStyleOptionIndex].getImage();
                    } else {
                      return CircularProgressIndicator();
                    }
                  },
                ),
              ),
              Container(
                height: 22.w, // again, w is not a typo here
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(5.5.h),
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
  FixedExtentScrollController thumbnailPrevController;

  @override
  void initState() {
    super.initState();
    var lastSelectedStyleIndex = Stores.styleOptionsStore.currentSelectedStyleOptionIndex;
    thumbnailPrevController = new FixedExtentScrollController(initialItem: lastSelectedStyleIndex);
  }

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
              child: RotatedBox(
                quarterTurns: 1,
                child: FutureBuilder(
                  future: DBUtils.getUnlockedStyles(),
                  builder: (context, AsyncSnapshot<List<StyleOption>> snapshot) {
                    if (snapshot.hasData) {
                      List<StyleOption> styleOpts = snapshot.data;
                      List<Widget> styleThumbnails = List<Widget>.from(
                        styleOpts.map(
                          (styleOption) {
                            return RotatedBox(
                              quarterTurns: -1,
                              child: Container(
                                height: 32.h,
                                width: 38.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3.w),
                                  image: DecorationImage(
                                    image: styleOption.getImage().image,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      );

                      return ListWheelScrollView(
                        itemExtent: 40.w,
                        children: styleThumbnails,
                        magnification: 1.1,
                        overAndUnderCenterOpacity: 0.5,
                        useMagnifier: true,
                        physics: FixedExtentScrollPhysics(),
                        controller: thumbnailPrevController,
                        diameterRatio: 5.2,
                        squeeze: 0.8,
                        onSelectedItemChanged: (index) {
                          Stores.styleOptionsStore.setCurrentSelectedStyleIdx(index);
                        },
                      );
                    } else {
                      return Container();
                    }
                  },
                ),
              ),
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

class InvertedTriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path clipPath = new Path();
    clipPath.lineTo(size.width / 2, size.height);
    clipPath.lineTo(size.width, 0.0);
    return clipPath;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

// TODO: Implement a Shadow around the triangle
// kind of tough because not all the sides have a shadow
class SmallInvertedTriangle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: InvertedTriangleClipper(),
      child: Container(
        height: 20.h,
        width: 27.w,
        decoration: BoxDecoration(
          color: Color(0xFF5B30EC),
        ),
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
    return Stack(
      children: <Widget>[
        // positionings are subject to change
        Positioned(
          bottom: (45 + 20).h,
          child: StyleOptionsPreview(),
        ),
        Positioned(
          bottom: 45.h,
          child: SmallInvertedTriangle(),
        ),
        Positioned(
          bottom: 0.0,
          child: StyleOptionsBar(),
        ),
      ],
    );
  }
}
