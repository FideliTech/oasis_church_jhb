import 'package:flutter/material.dart';
import 'package:oasis_church_jhb/reources/dimens.dart';
import 'package:oasis_church_jhb/reources/strings_resource.dart';
import 'package:oasis_church_jhb/utils/colors_util.dart';
import 'package:oasis_church_jhb/utils/widget_util.dart';

// ignore: must_be_immutable
class AboutUs extends StatelessWidget {
  final _minimumPadding = 8.0;
  BuildContext _buildContext;

  @override
  Widget build(BuildContext context) {
    _buildContext = context;
    return WillPopScope(
      child: Scaffold(
//        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: ColorsUtil.colorAccent,
          centerTitle: true,
          elevation: 0.5,
          title: Text(StringsResource.aboutAppTitle),
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                moveToPreviousScreen(true);
              }),
        ),
        body: WidgetUtil()
            .getGradientBackgroundContainer(Form(child: getDetailsScreen())),
      ),
      // ignore: missing_return
      onWillPop: () {
        moveToPreviousScreen(false);
      },
    );
  }

  Widget getDetailsScreen() {
    return ListView(
      children: <Widget>[getTextWidget(), getButtonRow()],
    );
  }

  Widget getTextWidget() {
    return Padding(
      padding: EdgeInsets.all(Dimens.sideMargin),
      child: new Text(
        StringsResource.about_us_description,
        style: TextStyle(color: Colors.black),
      ),
    );
  }

  Widget getButtonRow() {
    return Padding(
      padding: EdgeInsets.all(_minimumPadding),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              margin: EdgeInsets.only(
                  left: _minimumPadding, right: _minimumPadding),
              child: RaisedButton(
                  color: ColorsUtil.primaryColorDark,
                  shape: RoundedRectangleBorder(
                      side: BorderSide(
                          color: Theme.of(_buildContext).accentColor),
                      borderRadius: BorderRadius.circular(32)),
                  textColor: ColorsUtil.colorAccent,
                  child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: Dimens.sideMargin),
                      child: Text(
                        StringsResource.done,
                        textScaleFactor: 1.5,
                      )),
                  onPressed: () {
                    moveToPreviousScreen(false);
                  }),
            ),
          ),
        ],
      ),
    );
  }

  void moveToPreviousScreen(bool hasChanged) {
    Navigator.pop(_buildContext, hasChanged);
  }
}
