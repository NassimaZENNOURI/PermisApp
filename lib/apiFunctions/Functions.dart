import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:onesignal_flutter/onesignal_flutter.dart';
import '../Components/appVars.dart';
import '../Screens/coach/coatch_notification_page.dart';

class Functions {

  getUser(String token) async {
    try {
      var response = await http.get(
        Uri.parse("${link}me"),
        headers: {
          "Content-type": "application/json",
          "Accept": "application/json",
          "Authorization": "Bearer $token",
        },
      );
      return response;
    } catch (e) {
      return e.toString();
    }
  }
  getSeancesId(String token, String id) async {
    try {
      var response = await http.get(
        Uri.parse("${link}seances/$id"),
        headers: {
          "Content-type": "application/json",
          "Accept": "application/json",
          "Authorization": "Bearer $token",
        },
      );
      return response;
    } catch (e) {
      return e.toString();
    }
  }

  getFacturesId(String token, String id) async {
    try {
      var response = await http.get(
        Uri.parse("${link}facturations/$id"),
        headers: {
          "Content-type": "application/json",
          "Accept": "application/json",
          "Authorization": "Bearer $token",
        },
      );
      return response;
    } catch (e) {
      return e.toString();
    }
  }

   static  initOneSignal() async {
    await OneSignal.shared.setAppId("ae3cedf2-3ccd-4dbc-977d-46d7d06a2626");
    String osUserID = 'userID';
    OneSignal.shared.setSubscriptionObserver((changes) async {
      osUserID = changes.to.userId ?? '';
      String playerid = osUserID;
      await SessionManager().set('fcm', playerid);
    });
    await OneSignal.shared.promptUserForPushNotificationPermission(
      fallbackToSettings: true,
    );

    OneSignal.shared.setNotificationWillShowInForegroundHandler(
            (OSNotificationReceivedEvent event) {
           event.complete(event.notification);
        });
    OneSignal.shared.setNotificationOpenedHandler((OSNotificationOpenedResult result) {

    });
    OneSignal.shared.setPermissionObserver((OSPermissionStateChanges changes) {});
    await OneSignal.shared.getDeviceState();
  }

  static sendNotification(String? fcm, heading, content, String selectedperiod,String coachName,String startdate) async {
    await OneSignal.shared.postNotification(OSCreateNotification(
      additionalData: {"periode":selectedperiod,"coachName":coachName,"startdate":startdate},
      playerIds: [fcm!],
      content: content,
      heading: heading,
    ));
    OneSignal.shared.setNotificationOpenedHandler((openedResult) {
      Get.to(NotificationPage(body: openedResult.notification.body,additionalData: openedResult.notification.additionalData));
    });
  }

  static permissionNotification(){
    OneSignal.shared.setPermissionObserver((OSPermissionStateChanges changes) {

    });
  }

}

