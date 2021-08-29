import 'dart:convert';
import 'package:http/http.dart' as http;

class Networking{

  Networking (this.url);
  final String url;

  Future<dynamic> getRate() async{

    http.Response response = await http.get((Uri.parse(url)));
    if (response.statusCode == 200){
      return (jsonDecode(response.body));
    }
    else{
      print (response.statusCode);
      return null;
    }
  }
}