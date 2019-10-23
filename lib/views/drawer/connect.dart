import 'package:flutter/material.dart';
import 'package:oasis_church_jhb/models/ConnectMethod.dart';
import 'package:oasis_church_jhb/reources/dimens.dart';
import 'package:oasis_church_jhb/reources/strings_resource.dart';
import 'package:oasis_church_jhb/utils/colors_util.dart';
import 'package:oasis_church_jhb/utils/widget_util.dart';

class Connect extends StatefulWidget {
  @override
  _ConnectState createState() => _ConnectState();
}

class _ConnectState extends State<Connect> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
//        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: ColorsUtil.colorAccent,
          centerTitle: true,
          elevation: 0.5,
          title: Text(StringsResource.connectWithUs),
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              onPressed: () {
                moveToPreviousScreen(true);
              }),
        ),
        body: WidgetUtil().getGradientBackgroundContainer(getBody()),
      ),
      // ignore: missing_return
      onWillPop: () {
        moveToPreviousScreen(false);
      },
    );
  }

  Widget getBody() {
    var facebook = ConnectMethod(
        "Facebook", "https://www.facebook.com/oasisjhb/", "assets/images/facebook_logo.png");
    var twitter =
        ConnectMethod("Twitter", "https://twitter.com/oasisjhb?lang=en", "assets/images/twitter.png");
    var instagram =
        ConnectMethod("Instagram", "https://www.instagram.com/oasisjhb/?hl=en", "assets/images/insta.png");
    var connect = ConnectMethod("Connect groups", "", "assets/images/connect.png");

    ListView lv = ListView(
      children: <Widget>[
        WidgetUtil.getConnectButton(facebook),
        WidgetUtil.getConnectButton(twitter),
        WidgetUtil.getConnectButton(instagram),
        WidgetUtil.getConnectButton(connect),
      ],
    );

    return Column(
      children: <Widget>[
        Flexible(flex: 2, child: WidgetUtil.getConnectHeaderImage()),
        Flexible(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: Dimens.baseMargin),
            child: lv,
          ),
        )
      ],
    );
  }

  void moveToPreviousScreen(bool hasChanged) {
    Navigator.pop(context, hasChanged);
  }
}
