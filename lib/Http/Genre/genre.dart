import 'package:hoichoi_clone_app/Model/Genre/genre.dart';
import 'package:hoichoi_clone_app/constants.dart';
import 'package:http/http.dart' as http;

class HttpGenre {
  Future<Genre?> getgenre() async {
    var request = http.Request('POST', Uri.parse('$baseurl/api/v1/genres'));

    http.StreamedResponse response = await request.send();
    var responsedata = await http.Response.fromStream(response);

    if (response.statusCode == 200) {
      return genreFromJson(responsedata.body);
    } else {
      print(responsedata.body);
    }
  }
}
