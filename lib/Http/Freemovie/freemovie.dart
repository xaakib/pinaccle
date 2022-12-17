import 'package:hoichoi_clone_app/Model/Freemovie/freemovie.dart';
import 'package:hoichoi_clone_app/constants.dart';
import 'package:http/http.dart' as http;

class HttpFreemovie {
  Future<Freemovie?> getfreemovie() async {
    var request = http.Request('GET', Uri.parse('$baseurl/api/v1/freemovie'));

    http.StreamedResponse response = await request.send();
    var responsedata = await http.Response.fromStream(response);

    if (response.statusCode == 200) {
      return freemovieFromJson(responsedata.body);
    } else {
      print(responsedata.body);
    }
  }
}
