import 'package:http/http.dart' as http;
import 'dart:convert';

String _basicAuth = 'Basic${base64Encode(utf8.encode('sued:suady'))}';

Map<String, String> myheaders = {'authorization': _basicAuth};

class Crud {
  getRequest(String url) async {
    try {
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200 || response.statusCode == 201) {
        var responsebody = jsonDecode(response.body);
        return responsebody;
      } else {}
      // ignore: empty_catches
    } catch (e) {
      print("<><>$e<><>");
    }
  }

  postRequest(String url, Map data) async {
    try {
      var response =
          await http.post(Uri.parse(url), body: data, headers: myheaders);
      if (response.statusCode == 200 || response.statusCode == 201) {
        var responsebody = jsonDecode(response.body);
        return responsebody;
      } else {}
      // ignore: empty_catches
    } catch (e) {
      print("postRequest:<><>$e<><>");
    }
  }
}
