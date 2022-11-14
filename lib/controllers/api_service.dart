import 'package:dio/dio.dart';
final String API_KEY = '';
class HttpService {
  Dio _dio = Dio();

  HttpService() {
    _dio = Dio(BaseOptions(baseUrl: "https://mobizate.com/esp32/", headers: {"Authorization": "Bearer $API_KEY"}));
    initializeInterceptors();
  }

  Future<Response> getRequestWithBody(String url, body) async {
    // TODO: implement getRequest

    Response response;
    try {
      response = await _dio.get(url, queryParameters: body);
    } on DioError catch (e) {
      throw Exception(e.message);
    } catch (e) {
      rethrow;
    } finally {}

    return response;
  }



  initializeInterceptors() {
    _dio.interceptors.add(InterceptorsWrapper(onRequest: (request, handler) {
      // Do something before request is sent
      print("${request.method} | ${request.path}");
      return handler.next(request); //continue
    }, onResponse: (response, handler) {
      // Do something with response data
      print("response naseef ${response.statusCode} ${response.statusMessage} ${response.data}");
      return handler.next(response); // continue
    }, onError: (DioError e, handler) {
      // Do something with response error
      print('error naseef' + e.message);
      return handler.next(e);
    }));
  }
}