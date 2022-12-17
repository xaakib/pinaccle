import 'package:http/http.dart' as http;

import '../../Model/History/history.dart';
import '../../Model/Notification/notification.dart';
import '../../constants.dart';

class HttpNotification {
  Future<NotificationAll?> getnotification() async {
    var request = http.Request(
        'GET', Uri.parse('$baseurl/api/v1/notification'));

    http.StreamedResponse response = await request.send();
    var responsedata = await http.Response.fromStream(response);

    if (response.statusCode == 200) {
      return notificationFromJson(responsedata.body);
    } else {
      print(response.reasonPhrase);
    }
  }
}
