import 'package:flutter/material.dart';
import 'package:oasis_church_jhb/models/Sermon.dart';
import 'package:oasis_church_jhb/reources/dimens.dart';
import 'package:oasis_church_jhb/utils/colors_util.dart';
import 'package:oasis_church_jhb/utils/functions_util.dart';
import 'package:oasis_church_jhb/utils/widget_util.dart';

class SermonPlayback extends StatefulWidget {
  final Sermon _sermon;

  SermonPlayback(this._sermon);

  @override
  _SermonPlaybackState createState() =>
      _SermonPlaybackState(_sermon.title, _sermon.speaker, _sermon.graphicLink);
}

class _SermonPlaybackState extends State<SermonPlayback> {
  final title;
  final artist;
  final image;

  _SermonPlaybackState(this.title, this.artist, this.image);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          backgroundColor: ColorsUtil.primaryColorDark,
          body: Stack(
            children: <Widget>[
              ListView(
                children: <Widget>[
                  Container(
                    height: 400.0,
                    child: Stack(
                      children: <Widget>[
                        image.isEmpty
                            ? WidgetUtil.getBigEmptySpeaker()
                            : Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
//                          image: NetworkImage(image), fit: BoxFit.cover)), todo Use when using remote db
                                        image: AssetImage(image),
                                        fit: BoxFit.cover)),
                              ),
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [
                                  ColorsUtil.colorAccent.withOpacity(0.4),
                                  ColorsUtil.primaryColorDark
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter),
                          ),
                        ),
                        Center(
                          child: Column(
                            children: <Widget>[
                              // SizedBox(height: 52.0),

                              Spacer(),
                              Text(title,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 32.0)),
                              SizedBox(
                                height: 6.0,
                              ),
                              Text(
                                artist,
                                style: TextStyle(
                                    color: Colors.white.withOpacity(0.6),
                                    fontSize: 18.0),
                              ),
                              SizedBox(height: 16.0),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
//              SizedBox(height: 42.0),
                  Slider(
                    onChanged: (double value) {},
                    value: 0.2,
                    activeColor: ColorsUtil.primaryColor,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          '2:10',
                          style:
                              TextStyle(color: Colors.white.withOpacity(0.7)),
                        ),
                        Text('-03:56',
                            style:
                                TextStyle(color: Colors.white.withOpacity(0.7)))
                      ],
                    ),
                  ),
                  //Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.fast_rewind,
                        color: Colors.white54,
                        size: 42.0,
                      ),
                      SizedBox(width: 32.0),
                      Container(
                          decoration: BoxDecoration(
                              color: ColorsUtil.primaryColor,
                              borderRadius: BorderRadius.circular(50.0)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.play_arrow,
                              size: 58.0,
                              color: Colors.white,
                            ),
                          )),
                      SizedBox(width: 32.0),
                      Icon(
                        Icons.fast_forward,
                        color: Colors.white54,
                        size: 42.0,
                      )
                    ],
                  ),
                  //Spacer(),
//              Row(
//                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                children: <Widget>[
//                  Icon(
//                    Icons.bookmark_border,
//                    color: ColorsUtil.primaryColor,
//                  ),
//                  Icon(
//                    Icons.shuffle,
//                    color: ColorsUtil.primaryColor,
//                  ),
//                  Icon(
//                    Icons.repeat,
//                    color: ColorsUtil.primaryColor,
//                  ),
//                ],
//              ),
                  SizedBox(height: 58.0),
                ],
              ),
              WidgetUtil.getCustomAppBar("Playlist",
                  subTitle: "Best Vibes of the week",
                  rightIcon: Icons.playlist_add,
                  leftIcon: Icons.arrow_back_ios,
                  itemsColor: Colors.white,
                  onLeftIconClick: _onBackPressed,
                  onRightIconClick: _onAddToPlaylistPressed),
            ],
          ),
        ),
        // ignore: missing_return
        onWillPop: () {
          FunctionsUtil.moveToPreviousScreen(true, context);
        });
  }

  void _onBackPressed() {
    FunctionsUtil.moveToPreviousScreen(true, context);
  }

  void _onAddToPlaylistPressed() {}
}
