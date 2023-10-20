import 'dart:convert';

import 'package:http/http.dart' as http;

List newsData = [];

class HttpService{

  Future<dynamic> get( url) async {
    try {
      final response = await http.get(Uri.parse(url));
      newsData = jsonDecode(response.body)["results"];
      print(newsData);

    }catch(e){
      print("Exception of data: $e");
    }
    return newsData;
  }

}