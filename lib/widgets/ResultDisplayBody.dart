import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/PictureCard.dart';

enum DisplayLayout { PORTRAIT, LANDSCAPE }

class ResultDisplayBody extends StatefulWidget {
  ResultDisplayBody({Key key, this.chosenImage}) : super(key: key);

  final Image chosenImage;
  @override
  _ResultDisplayBodyState createState() => _ResultDisplayBodyState();
}

class _ResultDisplayBodyState extends State<ResultDisplayBody> {
  DisplayLayout layout;
  @override
  void initState() {
    if (widget.chosenImage.width < widget.chosenImage.height) {
      layout = DisplayLayout.PORTRAIT;
    } else {
      layout = DisplayLayout.LANDSCAPE;
    }
    super.initState();
  }

  Future<Image> getProcessedImage() async {
    // TODO: Interact with PlatformChannel
    return widget.chosenImage;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 11.h, horizontal: 11.w),
      height: 101.5.h,
      child: Column(
        children: <Widget>[
          Text(
            'Result',
            style: TextStyle(
              fontSize: 14.sp,
              fontFamily: 'SegoePrint',
            ),
          ),
          /*if (layout == DisplayLayout.PORTRAIT)
            Column(
              children: <Widget>[
                PictureCard(
                  image: widget.chosenImage,
                  actionButtonColor: Color(0xFF110864),
                  cardType: PictureCardType.WIDTH_CONSTRAIN,
                  onImagePress: () {},
                  onActionPress: () {
                    Scaffold.of(context).showBottomSheet((context) => null);
                  },
                ),
                PictureCard(
                  image: widget.chosenImage,
                  actionButtonColor: Color(0xFF820B5E),
                  cardType: PictureCardType.WIDTH_CONSTRAIN,
                  onImagePress: () {},
                  onActionPress: () {
                    Scaffold.of(context).showBottomSheet((context) => null);
                  },
                ),
              ],
            )
          else
            PageView(
              children: <Widget>[
                PictureCard(
                  image: widget.chosenImage,
                  actionButtonColor: Color(0xFF110864),
                  cardType: PictureCardType.HEIGHT_CONSTRAIN,
                  onImagePress: () {},
                  onActionPress: () {
                    Scaffold.of(context).showBottomSheet((context) => null);
                  },
                ),
                PictureCard(
                  image: widget.chosenImage,
                  actionButtonColor: Color(0xFF820B5E),
                  cardType: PictureCardType.HEIGHT_CONSTRAIN,
                  onImagePress: () {},
                  onActionPress: () {
                    Scaffold.of(context).showBottomSheet((context) => null);
                  },
                ),
              ],
            ),*/
        ],
      ),
    );
  }
}
