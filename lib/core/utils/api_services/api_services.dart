import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;
  final String _baseUrl = 'http://192.168.43.183:8000/api/';
  ApiService(this._dio);
  Future<dynamic> get({
    required String endpoint,
    String? bearerToken,
    Map<String, dynamic>? queryParameters,
  }) async {
   _dio.options.headers['Authorization'] = 'Bearer $bearerToken';
    var response = await _dio.get(
      '$_baseUrl$endpoint',
      queryParameters: queryParameters,
    );
    return response.data;
  }

  Future<Map<String, dynamic>> post(
      {required String endpoint, required dynamic data , String? token}) async {
    _dio.options.headers['Accept'] = 'application/json';
     _dio.options.headers['Authorization'] = 'Bearer $token';
    var response = await _dio.post('$_baseUrl$endpoint', data: data);
    return response.data;
  }

  Future<Map<String, dynamic>> postWithToken(
      {required String endpoint,
      required Map<String, dynamic> data,
      required String bearerToken}) async {
    //String? myToken = SharedPref.getData(key: 'token');
    //_dio.options.headers['Authorization'] = 'Bearer $myToken';
    var response = await _dio.post('$_baseUrl$endpoint', data: data);
    return response.data;
  }
}
