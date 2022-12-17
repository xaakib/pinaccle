import '../../Model/Genralist/genralist.dart';
import 'package:http/http.dart' as http;

import '../../constants.dart';

class Httpgenra {
  Future<Genrelist?> getgenralist() async {
    var request = http.Request(
        'POST', Uri.parse('$baseurl/api/v1/genres'));

    http.StreamedResponse response = await request.send();
    var responsedata = await http.Response.fromStream(response);

    if (response.statusCode == 200) {
      return genrelistFromJson(responsedata.body);
    } else {
      print(response.reasonPhrase);
    }
  }
}
