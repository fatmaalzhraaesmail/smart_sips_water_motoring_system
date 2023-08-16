import 'package:dio/dio.dart';

class ApiService {
  ApiService._();
  static final ApiService service = ApiService._();
  final Dio objectDio = Dio();

  
  Future<Map<String, dynamic>> get(String url,
      {Map<String, dynamic>? query}) async {
    print(query);
    print(url);
    try {
      Response response = await objectDio.get(url, queryParameters: query);
      print(response.statusCode);

      if (response.statusCode == 200) {
        var jsonBody = response.data;
        print('this is json body $jsonBody');
        return jsonBody;
      } else {
        throw Exception('unable to fetch data');
      }
    } catch (e) {
      print('eeeeee$e');
      return {};
      
    }
  }
}
