import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:oasis_church_jhb/models/Sermon.dart';
import 'package:oasis_church_jhb/reources/dimens.dart';
import 'package:oasis_church_jhb/reources/strings_resource.dart';

import 'colors_util.dart';

class WidgetUtil {
//  static SMSResultListener smsResultListener;
  final _minimumPadding = 8.0;
  static const platform = MethodChannel('sendSMS');

//
//  Future<Null> _sendSms(String text, Device device) async {
//    try {
//      final String result = await platform.invokeMethod('sendNow',
//          <String, dynamic>{"phone": device.deviceNumber, "msg": text});
//      print(result);
//      smsResultListener.success();
//    } on PlatformException catch (e) {
//      print(e.toString());
//      smsResultListener.failure();
//    } on MissingPluginException catch (e) {
//      print(e.toString());
//      smsResultListener.failure();
//    }
//  }

//  void sendSMS(String text, Device device) async {
//    await _sendSms(text, device);
//  }

  Widget getSpeakerImage(Sermon sermon) {
    return Container(
      child: speakerImage(sermon.graphicLink),
    );
  }

  void showAlertDialog(BuildContext context, String title, String message) {
    AlertDialog alertDialog = AlertDialog(
      title: Text(title),
      content: Text(message),
    );
    showDialog(context: context, builder: (_) => alertDialog);
  }

  Widget drawerText() {
    var appName = Text(
      "App by ",
      style: TextStyle(color: Colors.black.withOpacity(0.5)),
    );
    var fideli = Text(
      "Fideli",
      style: TextStyle(
          fontWeight: FontWeight.bold, color: Colors.black.withOpacity(0.5)),
    );
    var tech = Text(
      "Tech  ",
      style: TextStyle(
          fontWeight: FontWeight.bold, color: Colors.green.withOpacity(0.5)),
    );

    var image = Container(
      height: 20.0,
      width: 20.0,
      alignment: Alignment.centerRight,
      decoration: BoxDecoration(
          color: Colors.white70.withOpacity(0.5),
          image: DecorationImage(
            image: AssetImage("assets/images/fidelitech_logo-cutout.png"),
          )),
    );

    return Row(
      children: <Widget>[appName, fideli, tech, image],
    );
  }

  Widget getOnCircle() {
    return CircleAvatar(
      radius: 110.0,
      backgroundColor: Colors.lightBlueAccent,
      child: CircleAvatar(
        radius: 90.0,
        backgroundColor: Colors.black45,
        child: CircleAvatar(
          radius: 30.0,
          backgroundColor: Colors.lightBlueAccent,
          child: Icon(
            Icons.flash_on,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget speakerImage(String imageLink) {
    if (imageLink.isEmpty) {
      return Container(
          child: CircleAvatar(
        radius: 60.0,
        backgroundColor: Colors.grey,
        child: CircleAvatar(
          radius: 59.0,
          backgroundColor: Colors.black45,
          child: CircleAvatar(
            radius: 58.0,
            backgroundColor: Colors.lightBlueAccent,
            child: CircleAvatar(
              radius: 56.0,
              backgroundColor: Colors.black87,
              child: Icon(
                Icons.settings_voice,
                color: Colors.deepOrange.withOpacity(0.7),
              ),
            ),
          ),
        ),
      ));
    } else {
      return Stack(children: <Widget>[
        CircleAvatar(
          radius: 60.0,
          backgroundColor: ColorsUtil.primaryColorDark,
        ),
        CircleAvatar(
          radius: 59.0,
          backgroundImage: AssetImage(imageLink),
        )
      ]);
    }
  }

  Widget sermonTileDetail(Sermon sermon) {
    var title = Text(
      sermon.title,
      textAlign: TextAlign.left,
      style: TextStyle(
          color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16.0),
    );
    var date = Text(
      sermon.date,
      textAlign: TextAlign.left,
      style: TextStyle(color: Colors.white54, fontSize: 12.0),
    );
    var speaker = Text(
      sermon.speaker,
      textAlign: TextAlign.start,
      style: TextStyle(color: Colors.white70, fontSize: 16.0),
    );
    var summary = Text(
      sermon.summary,
      textAlign: TextAlign.start,
      style: TextStyle(color: Colors.white54, fontSize: 12.0),
    );

    return Padding(
        padding: EdgeInsets.all(Dimens.baseMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[title, speaker, date, summary],
        ));
  }

  Widget getGradientContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(const Radius.circular(5.0)),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.1, 0.7, 1],
          colors: [
            Colors.black45,
            Colors.black45,
            Colors.black45,
          ],
        ),
      ),
      child: child,
    );
  }

  Widget getImageGradientOverlay(Widget child) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(const Radius.circular(5.0)),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.1, 0.7, 1],
          colors: [
            Colors.black45,
            Colors.black45,
            Colors.black45,
          ],
        ),
      ),
      child: child,
    );
  }

  Widget getGradientBackgroundContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        // Box decoration takes a gradient
        gradient: LinearGradient(
          // Where the linear gradient begins and ends
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          // Add one stop for each color. Stops should increase from 0 to 1
          stops: [0.1, 0.8, 1.0],
          colors: [
            ColorsUtil.colorAccent,
            ColorsUtil.primaryColorDark.withOpacity(0.8),
            ColorsUtil.primaryColorDark,
          ],
        ),
      ),
//          image: DecorationImage(
//              image: AssetImage("assets/images/.......png"),
//              fit: BoxFit.cover)),

      child: child,
    );
  }

  Widget getDrawerGradientContainer(Widget child/*, String title,
      {IconData leftIcon,
      IconData rightIcon,
      String subTitle,
      Color itemsColor,
      Function onLeftIconClick,
      Function onRightIconClick}*/) {
    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            // Box decoration takes a gradient
            gradient: LinearGradient(
              // Where the linear gradient begins and ends
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              // Add one stop for each color. Stops should increase from 0 to 1
              stops: [0.1, 0.8, 1.0],
              colors: [
                ColorsUtil.colorAccent,
                ColorsUtil.primaryColorDark.withOpacity(0.8),
                ColorsUtil.primaryColorDark,
              ],
            ),
          ),
          child: child,
        ),
//        WidgetUtil.getCustomAppBar(title,
//            subTitle: subTitle,
//            rightIcon: rightIcon,
//            leftIcon: leftIcon,
//            itemsColor: itemsColor,
//            onLeftIconClick: onLeftIconClick,
//            onRightIconClick: onRightIconClick),
      ],
    );
  }

//  GestureDetector getAnimatedSwitchWidget(
//          String label, bool isActive, Function _toggle) =>
//      GestureDetector(
//        onTap: _toggle,
//        behavior: HitTestBehavior.translucent,
//        child: Row(
//          mainAxisAlignment: MainAxisAlignment.spaceBetween,
//          children: <Widget>[
//            Padding(
//              padding:
//                  const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
//              child: Text(label,
//                  textScaleFactor: 1.2,
//                  style: new TextStyle(color: Colors.white70)),
//            ),
//            Padding(
//              padding:
//                  const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
//              child: AnimatedSwitch(checked: isActive),
//            )
//          ],
//        ),
//      );

  Widget getTextFieldWidget(String label, String hint,
      TextEditingController controller, bool isTextValid, String errorText,
      [bool isNumber = false]) {
    return Padding(
      padding: EdgeInsets.all(_minimumPadding * 2),
      child: Form(
        child: new TextFormField(
          //style: appliedTextStyle,
          controller: controller,
          style: TextStyle(color: Colors.white70),
          keyboardType: isNumber ? TextInputType.number : TextInputType.text,
          decoration: InputDecoration(
              labelText: label,
              //labelStyle: appliedTextStyle,
              errorStyle: TextStyle(fontSize: 15),
              hintText: hint,
              errorText: isTextValid ? null : errorText,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0))),
        ),
      ),
    );
  }

  Widget getButtonRow(String negativeButtonText, String primaryButtonText,
      Function onNegativeButtonClick, Function onPrimaryButtonClick) {
    return Padding(
      padding: EdgeInsets.all(_minimumPadding),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              margin: EdgeInsets.only(
                  left: _minimumPadding, right: _minimumPadding),
              child: RaisedButton(
                  color: Colors.transparent,
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: ColorsUtil.primaryColor),
                      borderRadius: BorderRadius.circular(20)),
                  textColor: Colors.white70,
                  child: Text(
                    negativeButtonText,
                    textScaleFactor: 1.5,
                  ),
                  onPressed: onNegativeButtonClick),
            ),
          ),
          getPrimaryButton(primaryButtonText, onPrimaryButtonClick),
        ],
      ),
    );
  }

  Widget getPrimaryButton(
      String primaryButtonText, Function onPrimaryButtonClick) {
    return Expanded(
        child: Container(
      margin: EdgeInsets.only(left: _minimumPadding, right: _minimumPadding),
      child: RaisedButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          color: ColorsUtil.primaryColor,
          textColor: Colors.black,
          child: Text(
            primaryButtonText,
            textScaleFactor: 1.5,
          ),
          onPressed: onPrimaryButtonClick),
    ));
  }

  Widget getPaddedWidget(Widget widget) {
    return Padding(
      padding: EdgeInsets.all(_minimumPadding),
      child: Row(
        children: <Widget>[
          widget,
        ],
      ),
    );
  }

  Widget getDrawer(Function connect, Function give, Function locate,
      Function privacy, Function about, Function settings) {
    return Drawer(
      child: Column(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(""),
            accountEmail: Text(""),
//            currentAccountPicture: new GestureDetector(
//              child: CircleAvatar(),
//            ),
            decoration: BoxDecoration(
                color: ColorsUtil.drawerHeaderBase,
                image: DecorationImage(
                    image: AssetImage("assets/images/ocj_logo_colored_bg.png"),
                    fit: BoxFit.contain)),
          ),
          ListTile(
            title: Text(StringsResource.connectWithUs),
            leading: Icon(
              Icons.compare_arrows,
              color: ColorsUtil.primaryColorDark,
            ),
            onTap: connect,
          ),
          ListTile(
            title: Text(StringsResource.give),
            leading: Icon(
              Icons.card_giftcard,
              color: ColorsUtil.primaryColorDark,
            ),
            onTap: give,
          ),
          ListTile(
            title: Text(StringsResource.locateUs),
            leading: Icon(
              Icons.location_on,
              color: ColorsUtil.primaryColorDark,
            ),
            onTap: locate,
          ),
          ListTile(
            title: Text(StringsResource.privacyPolicy),
            leading: Icon(
              Icons.security,
              color: ColorsUtil.primaryColorDark,
            ),
            onTap: privacy,
          ),
          ListTile(
            title: Text(StringsResource.aboutAppTitle),
            leading: Icon(
              Icons.info,
              color: ColorsUtil.primaryColorDark,
            ),
            onTap: about,
          ),
          ListTile(
            title: Text(StringsResource.settings),
            leading: Icon(
              Icons.settings,
              color: ColorsUtil.primaryColorDark,
            ),
            onTap: settings,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(_minimumPadding * 2),
              child: Align(
                alignment: Alignment.bottomRight,
                child: WidgetUtil().drawerText(),
              ),
            ),
          )
        ],
      ),
    );
  }

//  Widget getModeDisplayItem(List<T> modeList, int index, ModeValue modeValue,
//      ModeValue groupValue, Function onChangeMade, Function onEditTap) {
//    Mode mode = modeList.length > 0 ? modeList[index] : null;
//    return ListTile(
//        title: Text(modeList.length > 0 ? mode.modeTitle : "Mode",
//            style: TextStyle(
//              color: Colors.white70,
//            )),
//        leading: Radio(
//          activeColor: ColorsUtil.accentColor,
//          value: modeValue,
//          groupValue: groupValue,
//          onChanged: onChangeMade,
//        ),
//        trailing: GestureDetector(
//          child: Icon(
//            Icons.edit,
//            color: Colors.white70,
//          ),
//          onTap: onEditTap,
//        ));
//  }

  FloatingActionButton getFAB(Function onFABClick) {
    return FloatingActionButton(
      child: Icon(
        Icons.send,
        color: Colors.black,
      ),
      onPressed: onFABClick,
    );
  }

  static getBigEmptySpeaker() {
    return Center(
      child: CircleAvatar(
        radius: 120.0,
        backgroundColor: Colors.grey,
        child: CircleAvatar(
          radius: 115.0,
          backgroundColor: Colors.black45,
          child: CircleAvatar(
            radius: 108.0,
            backgroundColor: Colors.lightBlueAccent,
            child: CircleAvatar(
              radius: 106.0,
              backgroundColor: Colors.black87,
              child: Icon(
                Icons.settings_voice,
                color: Colors.deepOrange.withOpacity(0.7),
                size: 50.0,
              ),
            ),
          ),
        ),
      ),
    );
  }

  static getCustomAppBar(
    String title, {
    IconData leftIcon,
    IconData rightIcon,
    String subTitle,
    Color itemsColor,
    Function onLeftIconClick,
    Function onRightIconClick,
  }) {
    itemsColor == null ? itemsColor = Colors.white : itemsColor = itemsColor;

    if (subTitle == null) {
      subTitle = "";
    }

    return Padding(
      padding: EdgeInsets.all(Dimens.baseMargin),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: EdgeInsets.all(Dimens.sideMargin),
              child: Container(
                child: GestureDetector(
                  child: Icon(
                    leftIcon,
                    color: itemsColor,
                    size: 22,
                  ),
                  onTap: onLeftIconClick,
                ),
              ),
            ),
          ),
      Padding(
        padding: EdgeInsets.all(Dimens.mediumMargin),
        child:Column(
            children: <Widget>[
              Text(
                title.toUpperCase(),
                style: TextStyle(
                    color: itemsColor.withOpacity(0.8),
                    fontSize: subTitle == "" ? 20.0 : 14.0,
                    fontWeight: FontWeight.w400),
              ),
              Text(subTitle, style: TextStyle(color: itemsColor)),
            ],
          ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: EdgeInsets.all(Dimens.sideMargin),
              child: Container(
                child: GestureDetector(
                    child: Icon(
                      rightIcon,
                      color: itemsColor,
                    ),
                    onTap: onRightIconClick),
              ),
            ),
          ),
        ],
      ),
    );
  }

  static Widget getWordOfTheDayWidget(String verse, String verseNumber) {
    return Container(
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(Dimens.largeMargin),
          child: Column(
            children: <Widget>[
              Text(
                "\"" + verse + "\"",
                style: TextStyle(
                    fontStyle: FontStyle.italic, color: ColorsUtil.colorAccent),
              ),
              SizedBox(height: 16.0),
              Text(
                verseNumber,
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              )
            ],
          ),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(const Radius.circular(32.0)),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.1, 0.65, 1],
          colors: [
            ColorsUtil.primaryColorDark.withOpacity(0.6),
            ColorsUtil.primaryColorDark.withOpacity(0.3),
            ColorsUtil.primaryColorDark.withOpacity(0.0),
          ],
        ),
      ),
    );
  }

  static Widget getHomeScreenWidget(Sermon sermon) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            height: 150.0,
            child: Stack(
              children: <Widget>[
//                sermon.graphicLink.isEmpty
//                    ? WidgetUtil.getBigEmptySpeaker()
//                    : Container(
//                  decoration: BoxDecoration(
//                      image: DecorationImage(
////                          image: NetworkImage(image), fit: BoxFit.cover)), todo Use when using remote db
//                          image: AssetImage(sermon.graphicLink),
//                          fit: BoxFit.cover)),
//                ),
                Container(
//                  decoration: BoxDecoration(
//                    gradient: LinearGradient(
//                        colors: [
//                          ColorsUtil.colorAccent.withOpacity(0.4),
//                          ColorsUtil.primaryColorDark
//                        ],
//                        begin: Alignment.topCenter,
//                        end: Alignment.bottomCenter),
//                  ),
                    ),
                Center(
                  child: Column(
                    children: <Widget>[
                      // SizedBox(height: 52.0),

                      Spacer(),
                      Text(sermon.title,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 32.0)),
                      SizedBox(
                        height: 6.0,
                      ),
                      Text(
                        sermon.speaker,
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
                  style: TextStyle(color: Colors.white.withOpacity(0.7)),
                ),
                Text('-03:56',
                    style: TextStyle(color: Colors.white.withOpacity(0.7)))
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
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(const Radius.circular(32.0)),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.1, 0.65, 1],
          colors: [
            ColorsUtil.primaryColorDark.withOpacity(0.6),
            ColorsUtil.primaryColorDark.withOpacity(0.4),
            ColorsUtil.primaryColorDark.withOpacity(0.0),
          ],
        ),
      ),
    );
  }
}
