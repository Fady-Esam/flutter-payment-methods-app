import 'package:dio/dio.dart';

class ApiService {
  final String baseUrl = 'https://api.stripe.com/v1/';
  final Dio dio;

  ApiService({required this.dio});

  Future<Response> post({
    required body,
    required String endPoint,
    required String token,
    String? contentType,
    Map<String, dynamic>? headers,
  }) async {
    var res = await dio.post(
      baseUrl + endPoint,
      data: body,
      options: Options(
        contentType: contentType,
        headers: headers ??
            {
              'Authorization': 'Bearer $token',
            },
      ),
    );
    return res;
  }

  // Future<Map<String, dynamic>> get({required String endPoint}) async {
  //   var res = await dio.get(baseUrl + endPoint);
  //   return res.data;
  // }
}
