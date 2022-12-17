import 'package:hoichoi_clone_app/Model/Allpages/allpage.dart';
import 'package:hoichoi_clone_app/constants.dart';
import 'package:http/http.dart' as http;

class HttpAllpages {
  Future<Allpages?> getallpages() async {
    var request = http.Request('GET', Uri.parse('$baseurl/api/v1/all_pages'));

    http.StreamedResponse response = await request.send();
    var responsedata = await http.Response.fromStream(response);

    if (response.statusCode == 200) {
      return allpagesFromJson(responsedata.body);
    } else {
      print(responsedata.body);
    }
  }
}
