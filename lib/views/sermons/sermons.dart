import 'package:flutter/material.dart';
import 'package:oasis_church_jhb/models/Sermon.dart';
import 'package:oasis_church_jhb/utils/strings_util.dart';
import 'package:oasis_church_jhb/utils/widget_util.dart';
import 'package:oasis_church_jhb/views/sermons/sermon_playback.dart';

class Sermons extends StatefulWidget {
  @override
  _SermonsState createState() => _SermonsState();
}

class _SermonsState extends State<Sermons> {
  List<Sermon> _sermons = List();
  bool _fetchingData = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _sermons.add(Sermon(
        "Transcendental Faith",
        "06-01-2018",
        "Ps. Majali",
        StringsUtil.truncate(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor"),
        ""));
    _sermons.add(Sermon(
        "Transcendental Faith",
        "06-01-2018",
        "Ps. Majali",
        StringsUtil.truncate(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor"),
        "assets/images/2.jpeg"));
    _sermons.add(Sermon(
        "Transcendental Faith",
        "06-01-2018",
        "Ps. Majali",
        StringsUtil.truncate(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor"),
        "assets/images/3.jpeg"));
    _sermons.add(Sermon(
        "Transcendental Faith",
        "06-01-2018",
        "Ps. Majali",
        StringsUtil.truncate(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor"),
        "assets/images/4.jpeg"));
    _sermons.add(Sermon(
        "Transcendental Faith",
        "06-01-2018",
        "Ps. Majali",
        StringsUtil.truncate(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor"),
        "assets/images/5.jpeg"));
    _sermons.add(Sermon(
        "Transcendental Faith",
        "06-01-2018",
        "Ps. Majali",
        StringsUtil.truncate(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor"),
        "assets/images/6.jpeg"));
    _sermons.add(Sermon(
        "Transcendental Faith",
        "06-01-2018",
        "Ps. Majali",
        StringsUtil.truncate(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor"),
        "assets/images/7.jpeg"));
    _sermons.add(Sermon(
        "Transcendental Faith",
        "06-01-2018",
        "Ps. Majali",
        StringsUtil.truncate(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor"),
        "assets/images/8.jpeg"));
    _sermons.add(Sermon(
        "Transcendental Faith",
        "06-01-2018",
        "Ps. Majali",
        StringsUtil.truncate(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor"),
        "assets/images/9.jpeg"));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
//      backgroundColor: Colors.transparent,
      child: WidgetUtil().getGradientBackgroundContainer(_fetchingData
          ? Center(child: CircularProgressIndicator())
          : getSermonListView()),
    );
  }

  Widget getSermonListView() {
    return ListView.builder(
        itemCount: _sermons.length,
        itemBuilder: (BuildContext context, int position) {
          if (_sermons.isNotEmpty) {
            return Container(
                child: Card(
              borderOnForeground: false,
              color: Colors.transparent,
              elevation: 0,
              child: WidgetUtil.getSpeakerItem(_sermons[position], () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) =>
                        SermonPlayback(_sermons[position])));
              }),
            ));
          } else {
            return null;
          }
        });
  }

  void _navigateToPlaySermon(Sermon sermon) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) => SermonPlayback(sermon)));
  }
}
