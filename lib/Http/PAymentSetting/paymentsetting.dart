import 'package:hoichoi_clone_app/Model/PAymentSetting/paymentsetting.dart';
import 'package:hoichoi_clone_app/constants.dart';
import 'package:http/http.dart' as http;

class HttpPaymentSetting {
  Future<PaymentSetting?> getpaymentsetting() async {
    var request =
        http.Request('POST', Uri.parse('$baseurl/api/v1/payment_settings'));

    http.StreamedResponse response = await request.send();
    var responsedata = await http.Response.fromStream(response);

    if (response.statusCode == 200) {
      return paymentSettingFromJson(responsedata.body);
    } else {
      print(responsedata.body);
    }
  }
}
