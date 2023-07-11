import 'package:http/http.dart' as http;
import 'dart:convert';

class networkhelper {
  String url = '';
  networkhelper(String tempurl) {
    url = tempurl;
  }
  Future getdata() async {
    http.Response response = await http.get(Uri.parse(url as String));
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}
