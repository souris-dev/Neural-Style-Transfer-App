import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:style_transfer_app/pages/StartPage.dart';
import 'package:style_transfer_app/stores/SidePaneStore.dart';
import 'package:style_transfer_app/stores/Stores.dart';
import 'package:style_transfer_app/widgets/DAppBar.dart';
import 'package:style_transfer_app/widgets/LongPinkButton.dart';
import 'counter.dart';

void main() {
  runApp(StylizerApp());
}

class StylizerApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Stylizer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: StartPage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final counter = Counter();
  final sidePaneStore = SidePaneStore();

  @override
  void initState() {
    super.initState();
    ScreenUtil.init(width: 360, height: 640);
    Stores.initStores();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: <Widget>[
            DAppBar(),
            SizedBox(
              height: 50.h,
              width: double.infinity,
            ),
            Observer(
              builder: (_) => RaisedButton(
                child: Text(
                  Stores.sidePaneStore.isSidePaneOpen ? 'Close side pane' : 'Open side pane',
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.blue[500],
                onPressed: Stores.sidePaneStore.toggleSidePane,
              ),
            ),
            SizedBox(
              height: 50.h,
              width: double.infinity,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 21.w),
              width: double.infinity,
              child: LongPinkButton(
                onPress: Stores.sidePaneStore.toggleSidePane,
                text: 'PICK FROM GALLERY',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
