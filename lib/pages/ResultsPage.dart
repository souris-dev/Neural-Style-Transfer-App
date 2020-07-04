import 'package:flutter/material.dart';
import '../widgets/DAppBar.dart';

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
          // ResultDisplayBody(chosenImage),
          // StylesButton()
        ],
      ),
    );
  }
}
