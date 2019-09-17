
import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:oasis_church_jhb/reources/strings_resource.dart';
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

  @override
  Widget build(BuildContext context) {
    final _pages = [
      Home(),
      Sermons(),
      Giving(),
      Events(),
      Blog(),
    ];
    final bottomNavSelectedColor = const Color(0xFF7f6d1e);
    return Scaffold(
      body: _pages[currentPageIndex],
      backgroundColor: Colors.black45,
      appBar: AppBar(
        title: Text(
            StringsResource.appTitle),
        centerTitle: true,
        backgroundColor: Colors.white10,
      ),
      drawer: WidgetUtil()
          .getDrawer(_onConnectWithUsClick,_onGiveClick,_onLocateUsClick,_onPrivacyPolicyClick,_onAboutUsClick,_onSettingsClick),
      bottomNavigationBar: BubbleBottomBar(
        opacity: .2,
        backgroundColor: Colors.black87,
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
              backgroundColor: bottomNavSelectedColor,
              icon: Icon(
                Icons.home,
                color: Colors.grey,
              ),
              activeIcon: Icon(
                Icons.home,
                color: bottomNavSelectedColor,
              ),
              title: Text(StringsResource.home)),
          BubbleBottomBarItem(
              backgroundColor: bottomNavSelectedColor,
              icon: Icon(
                Icons.record_voice_over,
                color: Colors.grey,
              ),
              activeIcon: Icon(
                Icons.record_voice_over,
                color: bottomNavSelectedColor,
              ),
              title: Text(StringsResource.sermons)),
          BubbleBottomBarItem(
              backgroundColor: bottomNavSelectedColor,
              icon: Icon(
                Icons.card_giftcard,
                color: Colors.grey,
              ),
              activeIcon: Icon(
                Icons.card_giftcard,
                color: bottomNavSelectedColor,
              ),
              title: Text(StringsResource.give)),
          BubbleBottomBarItem(
              backgroundColor: bottomNavSelectedColor,
              icon: Icon(
                Icons.event,
                color: Colors.grey,
              ),
              activeIcon: Icon(
                Icons.event,
                color: bottomNavSelectedColor,
              ),
              title: Text(StringsResource.events)),
          BubbleBottomBarItem(
              backgroundColor: bottomNavSelectedColor,
              icon: Icon(
                Icons.chat,
                color: Colors.grey,
              ),
              activeIcon: Icon(
                Icons.chat,
                color: bottomNavSelectedColor,
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
}
