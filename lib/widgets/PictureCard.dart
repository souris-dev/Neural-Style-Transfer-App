import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Enum to describe what kind of a PictureCard to draw
// Use HEIGHT_CONSTRAIN when the image is in portrait mode
// otherwise use WIDTH_CONSTRAIN
enum PictureCardType { HEIGHT_CONSTRAIN, WIDTH_CONSTRAIN }

class PictureCard extends StatefulWidget {
  PictureCard({
    Key key,
    this.image,
    this.cardType,
    this.actionButtonColor,
    this.onActionPress,
    this.onImagePress,
  }) : super(key: key);

  final PictureCardType cardType;
  final Image image;
  final Color actionButtonColor;
  final Function onImagePress;
  final Function onActionPress;
  @override
  _PictureCardState createState() => _PictureCardState();
}

class _PictureCardState extends State<PictureCard> {
  Image image;
  double cardH, cardW;

  @override
  void initState() {
    super.initState();
    image = widget.image;

    if (widget.cardType == PictureCardType.HEIGHT_CONSTRAIN) {
      cardH = 489.h;
      cardW = (image.width / image.height) * cardH;
    } else {
      cardW = 489.w;
      cardH = (image.height / image.width) * cardW;
    }
  }

  @override
  Widget build(BuildContext context) {
    var actionButton = GestureDetector(
      onTap: widget.onActionPress,
      child: Container(
        width: 35.w,
        height: 27.h,
        decoration: BoxDecoration(
          color: Color(0xFF110864),
          borderRadius: BorderRadius.circular(21.h),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Color(0x70000000),
            ),
          ],
        ),
        child: Center(
          child: Text(
            '...',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
    // Kalyanaraman
    return Container(
      width: cardW,
      height: cardH,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: image.image,
          fit: BoxFit.fill,
        ),
        borderRadius: BorderRadius.circular(24.w),
        border: Border.all(
          color: Color(0xFFEFEFEF),
          width: 1,
        ),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Color(0xFFFAFAFA),
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Align(
        child: actionButton,
        alignment: Alignment(0.87, 0.02),
      ),
    );
  }
}
