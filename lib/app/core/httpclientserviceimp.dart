import 'package:http/http.dart' as http;

import 'httpclientservice.dart';

class HttpClientServiceImp implements HttpClientService {
  @override
  Future<Map> get(String url) async {
    final response = await http.get(Uri.parse(url));
    return {
      'statusCode': response.statusCode,
      'body': response.body,
      'headers': response.headers,
    };
  }
}
