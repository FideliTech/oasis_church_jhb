import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:oasis_church_jhb/reources/strings_resource.dart';
import 'package:oasis_church_jhb/utils/colors_util.dart';
import 'package:oasis_church_jhb/utils/widget_util.dart';
import 'package:oasis_church_jhb/views/blog/blog.dart';
import 'package:oasis_church_jhb/views/drawer/about_us.dart';
import 'package:oasis_church_jhb/views/events/events.dart';
import 'package:oasis_church_jhb/views/give/give.dart';
import 'package:oasis_church_jhb/views/home/home.dart';
import 'package:oasis_church_jhb/views/sermons/sermons.dart';
//import 'package:sqflite/sqlite_api.dart';

class BaseUI extends StatefulWidget {
  BaseUI();

  @override
  State<StatefulWidget> createState() {
    return BaseUIState();
  }
}

enum DataChangeMode {
  onDeviceAdded,
  onDeviceUpdated,
  onDeviceRemoved,
  onDeviceChanged
}

class BaseUIState extends State<BaseUI> {
  int currentPageIndex = 0;
  GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    scaffoldKey = new GlobalKey<ScaffoldState>();
    final _pages = [
      Home(),
      Sermons(),
      Giving(),
      Events(),
      Blog(),
    ];
    return Scaffold(
      key: scaffoldKey,
      body: WidgetUtil().getDrawerGradientContainer(
          _pages[currentPageIndex]/*, "OCJ",
          leftIcon: Icons.menu,
          itemsColor: Colors.black,
          onLeftIconClick: openDrawer*/),
      backgroundColor: ColorsUtil.colorAccent,
      appBar: AppBar(
        elevation: 0.5,
        title: Text(
            StringsResource.appTitle,),
        centerTitle: true,
        backgroundColor: ColorsUtil.colorAccent,
      ),

      drawer: WidgetUtil().getDrawer(
          _onConnectWithUsClick,
          _onGiveClick,
          _onLocateUsClick,
          _onPrivacyPolicyClick,
          _onAboutUsClick,
          _onSettingsClick),
      bottomNavigationBar: BubbleBottomBar(
        opacity: .2,
        backgroundColor: ColorsUtil.primaryColorDark,
        currentIndex: currentPageIndex,
        onTap: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        elevation: 8,
        //fabLocation: BubbleBottomBarFabLocation.end, //new
        hasNotch: true,
        //new
        hasInk: true,
        //new, gives a cute ink effect
        inkColor: Colors.black12,
        //optional, uses theme color if not specified
        items: <BubbleBottomBarItem>[
          BubbleBottomBarItem(
              backgroundColor: ColorsUtil.colorAccent,
              icon: Icon(
                Icons.home,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.home,
                color: ColorsUtil.colorAccent,
              ),
              title: Text(StringsResource.home)),
          BubbleBottomBarItem(
              backgroundColor: ColorsUtil.colorAccent,
              icon: Icon(
                Icons.record_voice_over,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.record_voice_over,
                color: ColorsUtil.colorAccent,
              ),
              title: Text(StringsResource.sermons)),
          BubbleBottomBarItem(
              backgroundColor: ColorsUtil.colorAccent,
              icon: Icon(
                Icons.card_giftcard,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.card_giftcard,
                color: ColorsUtil.colorAccent,
              ),
              title: Text(StringsResource.give)),
          BubbleBottomBarItem(
              backgroundColor: ColorsUtil.colorAccent,
              icon: Icon(
                Icons.event,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.event,
                color: ColorsUtil.colorAccent,
              ),
              title: Text(StringsResource.events)),
          BubbleBottomBarItem(
              backgroundColor: ColorsUtil.colorAccent,
              icon: Icon(
                Icons.chat,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.chat,
                color: ColorsUtil.colorAccent,
              ),
              title: Text(StringsResource.blog)),
        ],
      ),
    );
  }

//
  void _onAboutUsClick() {
    Navigator.of(context).pop();
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) => AboutUs()));
  }

  void _onPrivacyPolicyClick() {
    Navigator.of(context).pop();
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) => AboutUs()));
  }

  void _onLocateUsClick() {
    Navigator.of(context).pop();
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) => AboutUs()));
  }

  void _onGiveClick() {
    Navigator.of(context).pop();
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) => Giving()));
  }

  void _onConnectWithUsClick() {
    Navigator.of(context).pop();
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) => AboutUs()));
  }

  void _onSettingsClick() {
    Navigator.of(context).pop();
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) => AboutUs()));
  }

  void openDrawer() {
    scaffoldKey.currentState.openDrawer();
  }
}
