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
    );
    var fideli = Text(
      "Fideli",
      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
    );
    var tech = Text(
      "Tech  ",
      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green),
    );

    var image = Container(
      height: 20.0,
      width: 20.0,
      alignment: Alignment.centerRight,
      decoration: BoxDecoration(
          color: Colors.white70,
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

  Widget getEmptySpeakerImage() {
    return CircleAvatar(
      radius: 60.0,
      backgroundColor: Colors.grey,
      child: CircleAvatar(
        radius: 55.0,
        backgroundColor: Colors.black45,
        child: CircleAvatar(
          radius: 54.0,
          backgroundColor: Colors.lightBlueAccent,
          child: CircleAvatar(
            radius: 53.0,
            backgroundColor: Colors.black87,
            child: Icon(
              Icons.settings_voice,
              color: Colors.lightBlueAccent,
            ),
          ),
        ),
      ),
    );
  }

  Widget sermonTileDetail(Sermon sermon) {
    var title = Text(
      sermon.title,
      textAlign: TextAlign.left,
      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16.0),
    );
    var date = Text(
      sermon.date,
      textAlign: TextAlign.left,
      style: TextStyle(
        color: Colors.white54,
          fontSize: 12.0
      ),
    );
    var speaker = Text(
      sermon.speaker,
      textAlign: TextAlign.start,
      style: TextStyle(
        color: Colors.white70,
          fontSize: 16.0
      ),
    );
    var summary = Text(
      sermon.summary,
      textAlign: TextAlign.start,
      style: TextStyle(
        color: Colors.white54,
          fontSize: 12.0
      ),
    );

    return Padding(padding: EdgeInsets.all(Dimens.baseMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[title, speaker, date, summary],
    ));
  }

  Widget getGradientContainer(Widget child) {
    final backgroundColorGradientTop = const Color(0xFF7f6d1e);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(20.0),
            topRight: const Radius.circular(20.0),
            bottomLeft: const Radius.circular(20.0),
            bottomRight: const Radius.circular(20.0)),
        // Box decoration takes a gradient
        gradient: LinearGradient(
          // Where the linear gradient begins and ends
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          // Add one stop for each color. Stops should increase from 0 to 1
          stops: [
            0.1,
            0.7,
            1 /*, 0.9*/
          ],
          colors: [
            // Colors are easy thanks to Flutter's Colors class.
            Colors.black45,
            Colors.black45,
            Colors.black45,
//            backgroundColorGradientTop,
//            Colors.white,
          ],
        ),
      ),
      child: child,
    );
  }

  Widget getGradientBackgroundContainer(Widget child) {
    final backgroundColorGradientTop = const Color(0xFFDAA520);
    return Container(
//      decoration: BoxDecoration(
//          // Box decoration takes a gradient
//          /*gradient: LinearGradient(
//            // Where the linear gradient begins and ends
//            begin: Alignment.topCenter,
//            end: Alignment.bottomCenter,
//            // Add one stop for each color. Stops should increase from 0 to 1
//            stops: [0.1, 0.3, 0.9],
//            colors: [
//              // Colors are easy thanks to Flutter's Colors class.
//              backgroundColorGradientTop, Colors.black87, Colors.black,
//            ],
//          ),*/
//          image: DecorationImage(
//              image: AssetImage("assets/images/boroko-bg.png"),
//              fit: BoxFit.cover)),
      child: child,
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
                      side: BorderSide(color: ColorsUtil.accentColor),
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
          color: ColorsUtil.accentColor,
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
            accountName: Text(
              StringsResource.churchName,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            accountEmail: Text(StringsResource.churchMobileNumber),
            currentAccountPicture: new GestureDetector(
              child: CircleAvatar(),
            ),
            decoration: BoxDecoration(
              color: Colors.white30,
              /*image: DecorationImage(
                    image: AssetImage("assets/images/boroko-drawer-image.png"),
                    fit: BoxFit.cover)*/
            ),
          ),
          ListTile(
            title: Text(StringsResource.connectWithUs),
            leading: Icon(Icons.compare_arrows),
            onTap: connect,
          ),
          ListTile(
            title: Text(StringsResource.give),
            leading: Icon(Icons.card_giftcard),
            onTap: give,
          ),
          ListTile(
            title: Text(StringsResource.locateUs),
            leading: Icon(Icons.location_on),
            onTap: locate,
          ),
          ListTile(
            title: Text(StringsResource.privacyPolicy),
            leading: Icon(Icons.security),
            onTap: privacy,
          ),
          ListTile(
            title: Text(StringsResource.aboutAppTitle),
            leading: Icon(Icons.info),
            onTap: about,
          ),
          ListTile(
            title: Text(StringsResource.settings),
            leading: Icon(Icons.settings),
            onTap: settings,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(_minimumPadding*2),
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
}
