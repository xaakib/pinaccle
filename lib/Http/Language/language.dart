import 'package:hoichoi_clone_app/Model/Language/language.dart';
import 'package:hoichoi_clone_app/constants.dart';
import 'package:http/http.dart' as http;

class HttpLanguage {
  Future<Language?> getlanguage() async {
    var request = http.Request('POST', Uri.parse('$baseurl/api/v1/languages'));

    http.StreamedResponse response = await request.send();
    var responsedata = await http.Response.fromStream(response);

    if (response.statusCode == 200) {
      return languageFromJson(responsedata.body);
    } else {
      print(response.reasonPhrase);
    }
  }
}
