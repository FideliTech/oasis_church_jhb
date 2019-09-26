import 'package:flutter/material.dart';
import 'package:oasis_church_jhb/models/Sermon.dart';
import 'package:oasis_church_jhb/reources/strings_resource.dart';
import 'package:oasis_church_jhb/utils/colors_util.dart';
import 'package:oasis_church_jhb/utils/strings_util.dart';
import 'package:oasis_church_jhb/utils/widget_util.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _fetchingData = false;
  Sermon _sermon = Sermon(
      "Transcendental Faith",
      "06-01-2018",
      "Ps. Majali",
      StringsUtil.truncate(
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor"),
      "");

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorsUtil.colorAccent,
      child: WidgetUtil().getGradientBackgroundContainer(_fetchingData
          ? Center(child: CircularProgressIndicator())
          : getBody()),
    );
  }

  Widget getBody() {
    return ListView(
      children: <Widget>[
        WidgetUtil.getWordOfTheDayWidget(
            StringsResource.verseTest, StringsResource.verseNumTest),
        WidgetUtil.getHomeScreenWidget(_sermon)
      ],
    );
  }
}
