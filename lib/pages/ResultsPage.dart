import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../widgets/DAppBar.dart';
import '../widgets/StylesButton.dart';
import '../widgets/ResultDisplayBody.dart';
import '../widgets/StyleOptionsWidget.dart';
import '../stores/Stores.dart';
import 'FrostedGlassBlurOverlayedPage.dart';

class ResultsPage extends StatefulWidget {
  ResultsPage({Key key, this.chosenImage}) : super(key: key);

  final Image chosenImage;
  @override
  _ResultsPageState createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          DAppBar(),
          Observer(
            builder: (context) => Transform.translate(
              offset: Stores.sidePnStr.isSidePaneOpen ? Offset(MediaQuery.of(context).size.width * 0.55, 0) : Offset(0, 0),
              child: Stack(
                children: <Widget>[
                  AnimatedOpacity(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeIn,
                    opacity: Stores.sidePnStr.isSidePaneOpen || Stores.styleOptionsStore.isStyleOptionsOpen ? 0.5 : 1,
                    child: ResultDisplayBody(
                      chosenImage: widget.chosenImage,
                    ),
                  ),
                ],
              ),
            ),
          ),
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
    );
  }
}
