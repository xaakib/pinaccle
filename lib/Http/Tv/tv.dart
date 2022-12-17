import 'package:hoichoi_clone_app/Model/Tv/tv.dart';
import 'package:hoichoi_clone_app/constants.dart';
import 'package:http/http.dart' as http;

class HttpTv {
  Future<Tv?> gettv() async {
    var headers = {'Content-Type': 'text/plain'};
    var request = http.Request('POST', Uri.parse('$baseurl/api/v1/livetv'));
    request.body = '''{"filter"}''';
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    var responsedata = await http.Response.fromStream(response);

    if (response.statusCode == 200) {
      return tvFromJson(responsedata.body);
    } else {
      print(responsedata.body);
    }
  }
}
