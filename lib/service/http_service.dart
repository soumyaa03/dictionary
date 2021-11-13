import 'package:http/http.dart' as http;

class HttpService {
  // ignore: prefer_const_declarations
  static final baseURL = "https://api.dictionaryapi.dev/api/v2/entries/";
  static Future<http.Response> getRequest(endPoint) async {
    http.Response response;
    final url = Uri.parse("$baseURL$endPoint");
    response = await http.get(url);
    return response;
  }
}
