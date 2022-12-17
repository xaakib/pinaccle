import 'package:hoichoi_clone_app/Model/SubscriptionPlan/subscriptionplan.dart';
import 'package:hoichoi_clone_app/constants.dart';
import 'package:http/http.dart' as http;

class HttpSubscriptionPlan {
  Future<SubscriptionPlan?> getsubscriptionplan() async {
    var request =
        http.Request('POST', Uri.parse('$baseurl/api/v1/subscription_plan'));

    http.StreamedResponse response = await request.send();
    var responsedata = await http.Response.fromStream(response);

    if (response.statusCode == 200) {
      return subscriptionPlanFromJson(responsedata.body);
    } else {
      print(responsedata.body);
    }
  }
}
