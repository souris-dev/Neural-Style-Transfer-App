import 'dart:ui';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../widgets/DAppBar.dart';
import '../widgets/StylesButton.dart';
//import '../widgets/ResultDisplayBody.dart';
import '../widgets/StyleOptionsWidget.dart';
import '../stores/Stores.dart';
import 'FrostedGlassBlurOverlayedPage.dart';
import '../widgets/PictureCard.dart';

enum DisplayLayout { PORTRAIT, LANDSCAPE, UNDEF }

class ResultsPage extends StatefulWidget {
  ResultsPage({Key key, this.chosenImage}) : super(key: key);

  final Image chosenImage;
  @override
  _ResultsPageState createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsPage> {
  DisplayLayout layout;
  Size imgSize;
  bool bottomSheetOpen = false;

  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    if (widget.chosenImage.width == null) {
      print("------------------------------------------------");
      print("Chosen image width is null!");
    }

    layout = DisplayLayout.UNDEF;

    super.initState();
  }

  void setLayout() async {
    // Have to do the following shit to find the image width and height
    // after it gets loaded completely

    Completer<Size> completer = new Completer<Size>();
    widget.chosenImage.image.resolve(new ImageConfiguration()).addListener(ImageStreamListener((ImageInfo inf, bool _) {
      var img = inf.image;
      Size size = Size(img.width.toDouble(), img.height.toDouble());
      completer.complete(size);
    }));

    Size size = await completer.future;

    DisplayLayout lyt;
    if (size.width < size.height) {
      lyt = DisplayLayout.PORTRAIT;
    } else {
      lyt = DisplayLayout.LANDSCAPE;
    }

    setState(() {
      imgSize = size;
      layout = lyt;
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    setLayout();
  }

  Future<Image> getProcessedImage() async {
    // TODO: Interact with PlatformChannel
    return widget.chosenImage;
  }

  Widget _getResultDisplayBody() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 11.h, horizontal: 11.w),
      height: 500.5.h,
      child: Column(
        children: <Widget>[
          Text(
            'Result',
            style: TextStyle(
              fontSize: 14.sp,
              fontFamily: 'SegoePrint',
            ),
          ),
          SizedBox(
            height: 1.h,
            width: double.infinity,
          ),
          if (layout == DisplayLayout.LANDSCAPE)
            Column(
              children: <Widget>[
                PictureCard(
                  image: widget.chosenImage,
                  actionButtonColor: Color(0xFF110864),
                  cardType: PictureCardType.WIDTH_CONSTRAIN,
                  imgSize: imgSize,
                  onImagePress: () {},
                  onActionPress: () {
                    Scaffold.of(context).showBottomSheet((context) => null);
                  },
                ),
                PictureCard(
                  image: widget.chosenImage,
                  actionButtonColor: Color(0xFF820B5E),
                  cardType: PictureCardType.WIDTH_CONSTRAIN,
                  imgSize: imgSize,
                  onImagePress: () {},
                  onActionPress: () {
                    Scaffold.of(context).showBottomSheet((context) => null);
                  },
                ),
              ],
            )
          else if (layout == DisplayLayout.PORTRAIT)
            Container(
              height: 500.h,
              child: PageView(
                children: <Widget>[
                  PictureCard(
                    image: widget.chosenImage,
                    actionButtonColor: Color(0xFF110864),
                    cardType: PictureCardType.HEIGHT_CONSTRAIN,
                    imgSize: imgSize,
                    onImagePress: () {},
                    onActionPress: () {
                      if (!bottomSheetOpen) {
                        scaffoldKey.currentState.showBottomSheet((context) => Container(
                              height: 200.h,
                            ));
                      } else {
                        Navigator.of(context).pop();
                      }

                      setState(() {
                        bottomSheetOpen = !bottomSheetOpen;
                      });
                    },
                  ),
                  PictureCard(
                    image: widget.chosenImage,
                    actionButtonColor: Color(0xFF820B5E),
                    cardType: PictureCardType.HEIGHT_CONSTRAIN,
                    imgSize: imgSize,
                    onImagePress: () {},
                    onActionPress: () {
                      if (!bottomSheetOpen) {
                        scaffoldKey.currentState.showBottomSheet((context) => Container(
                              height: 200.h,
                            ));
                      } else {
                        Navigator.of(context).pop();
                      }

                      setState(() {
                        bottomSheetOpen = !bottomSheetOpen;
                      });
                    },
                  ),
                ],
              ),
            )
          else
            Column(
              children: <Widget>[
                Container(
                  height: 25.h,
                  width: 25.w,
                  child: CircularProgressIndicator(),
                )
              ],
            )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        body: Builder(
          builder: (ctx) => Column(
            children: <Widget>[
              DAppBar(),
              Expanded(child: _getResultDisplayBody()),

              /*Observer(
                builder: (context) => Transform.translate(
                  offset: Stores.sidePnStr.isSidePaneOpen ? Offset(MediaQuery.of(context).size.width * 0.55, 0) : Offset(0, 0),
                  child: Stack(
                    children: <Widget>[
                      ResultDisplayBody(
                        chosenImage: widget.chosenImage,
                      )
                      /*AnimatedOpacity(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                        opacity: Stores.sidePnStr.isSidePaneOpen || Stores.styleOptionsStore.isStyleOptionsOpen ? 0.5 : 1,
                        child: ResultDisplayBody(
                          chosenImage: widget.chosenImage,
                        ),
                      ),*/
                    ],
                  ),
                ),
              )*/
              StyleButton(
                onPressed: () {
                  Navigator.of(context).push(
                    new FrostedGlassBlurOverlayedPage(
                      animationStartValue: 0.0,
                      animationEndValue: 6.0,
                      animationDuration: Duration(milliseconds: 300),
                      page: StyleOptionsWidget(),
                    ),
                  );
                  Stores.styleOptStr.openStyleOptions();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
