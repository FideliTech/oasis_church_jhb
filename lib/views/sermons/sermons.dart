import 'package:flutter/material.dart';
import 'package:oasis_church_jhb/models/Sermon.dart';
import 'package:oasis_church_jhb/reources/dimens.dart';
import 'package:oasis_church_jhb/utils/strings_util.dart';
import 'package:oasis_church_jhb/utils/widget_util.dart';

class Sermons extends StatefulWidget {
  @override
  _SermonsState createState() => _SermonsState();
}

class _SermonsState extends State<Sermons> {
  List<Sermon> _sermons= List();
  bool _fetchingData = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _sermons.add(Sermon("Transcendental Faith","06-01-2018","Ps. Majali",StringsUtil.truncate("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor"),"assets/images/fidelitech_logo-cutout.png"));
    _sermons.add(Sermon("Transcendental Faith","06-01-2018","Ps. Majali",StringsUtil.truncate("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor"),"assets/images/fidelitech_logo-cutout.png"));
    _sermons.add(Sermon("Transcendental Faith","06-01-2018","Ps. Majali",StringsUtil.truncate("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor"),"assets/images/fidelitech_logo-cutout.png"));
    _sermons.add(Sermon("Transcendental Faith","06-01-2018","Ps. Majali",StringsUtil.truncate("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor"),"assets/images/fidelitech_logo-cutout.png"));
    _sermons.add(Sermon("Transcendental Faith","06-01-2018","Ps. Majali",StringsUtil.truncate("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor"),"assets/images/fidelitech_logo-cutout.png"));
    _sermons.add(Sermon("Transcendental Faith","06-01-2018","Ps. Majali",StringsUtil.truncate("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor"),"assets/images/fidelitech_logo-cutout.png"));
    _sermons.add(Sermon("Transcendental Faith","06-01-2018","Ps. Majali",StringsUtil.truncate("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor"),"assets/images/fidelitech_logo-cutout.png"));
    _sermons.add(Sermon("Transcendental Faith","06-01-2018","Ps. Majali",StringsUtil.truncate("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor"),"assets/images/fidelitech_logo-cutout.png"));
    _sermons.add(Sermon("Transcendental Faith","06-01-2018","Ps. Majali",StringsUtil.truncate("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor"),"assets/images/fidelitech_logo-cutout.png"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: WidgetUtil().getGradientBackgroundContainer(_fetchingData
          ? Center(child: CircularProgressIndicator())
          : getSermonListView()),
    );
  }

  ListView getSermonListView() {
    return ListView.builder(
        itemCount: _sermons.length,
        itemBuilder: (BuildContext context, int position) {
          if (_sermons.isNotEmpty) {
            return Container(
                margin: EdgeInsets.only(left: Dimens.baseMargin, right: Dimens.baseMargin, top: Dimens.baseMargin),
                child: Card(
                    borderOnForeground: true,
                    color: Colors.transparent,
                    elevation: 5,
                    child: WidgetUtil().getGradientContainer(
                      Padding(
                          padding:
                          EdgeInsets.only(bottom: (Dimens.baseMargin)),
                          child: getChannelListItem(_sermons[position])),
                    )));
          } else {
            return null;
          }
        });
  }

  Widget getChannelListItem(Sermon sermon) {
//    Widget editButton = GestureDetector(
//      child: Icon(
//        Icons.edit,
//        color: Colors.white54,
//      ),
//      onTap: () => navigateToSetChannelName(channel),
//    );

    Widget buttonColumn = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          GestureDetector(
            child: WidgetUtil().getEmptySpeakerImage(),
//            onTap: () => setState(() {
//
//            }),
          )
        ],
      ),
    );

    Widget detailsView = WidgetUtil().sermonTileDetail(sermon);

    return Row(crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        buttonColumn,
        detailsView,
      ],
    );
  }
}
