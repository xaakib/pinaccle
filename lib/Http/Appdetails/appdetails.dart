import 'package:hoichoi_clone_app/Model/Appdetails/appdetails.dart';
import 'package:hoichoi_clone_app/constants.dart';
import 'package:http/http.dart' as http;

class HttpAppdetails {
  Future<Appdetails?> getappdetails() async {
    var request =
        http.Request('POST', Uri.parse('$baseurl/api/v1/app_details'));

    http.StreamedResponse response = await request.send();
    var responsedata = await http.Response.fromStream(response);

    if (response.statusCode == 200) {
      return appdetailsFromJson(responsedata.body);
    } else {
      print(responsedata.body);
    }
  }
}
