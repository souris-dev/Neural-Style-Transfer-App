import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:style_transfer_app/stores/Stores.dart';
import 'package:style_transfer_app/widgets/LongPinkButton.dart';
import 'package:style_transfer_app/widgets/StartPageAppBar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'ResultsPage.dart';

class StartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(width: 360, height: 640);
    Stores.initStores();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          StartPageAppBar(),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 21.w),
                  child: Text(
                    'CHOOSE PICTURE',
                    style: TextStyle(
                      fontSize: 22.sp,
                      color: Color(0xFF1F0D43),
                      letterSpacing: 1.9,
                      wordSpacing: 2,
                    ),
                  ),
                ),
                SizedBox(
                  height: 45.h,
                  width: double.infinity,
                ),
                Wrap(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 21.w),
                      child: Text(
                        'You can choose a picture from your Gallery, or use the camera to take a new one.',
                        style: TextStyle(
                          fontSize: 15.sp,
                          color: Color(0xFF1F0D43),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 52.h,
                  width: double.infinity,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 21.w),
                  width: double.infinity,
                  child: LongPinkButton(
                    onPress: () async {
                      var image = await ImagePicker().getImage(source: ImageSource.gallery);
                      if (image != null)
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (ctx) => new ResultsPage(
                                  chosenImage: Image.file(File(image.path)),
                                )));
                    },
                    text: 'PICK FROM GALLERY',
                  ),
                ),
                SizedBox(
                  height: 22.h,
                  width: double.infinity,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 21.w),
                  width: double.infinity,
                  child: LongPinkButton(
                    onPress: () async {
                      var image = await ImagePicker().getImage(source: ImageSource.camera);
                      if (image != null)
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (ctx) => new ResultsPage(
                                  chosenImage: Image.file(File(image.path)),
                                )));
                    },
                    text: 'USE CAMERA',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
