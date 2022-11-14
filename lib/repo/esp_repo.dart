import 'package:dio/dio.dart';
import 'package:get/get.dart';
import '../constants/constants.dart';
import '../controllers/api_service.dart';
import '../models/dio_error.dart';
import '../models/esp_respons/esp_data_response.dart';
import '../models/my_response.dart';

class EspRepo {
  HttpService _httpService = HttpService();

  EspRepo() {
    _httpService = Get.put(HttpService());
  }

  Future<MyResponse> getEspData() async {
    // TODO: implement getNewsHeadline
    try {
      final response = await _httpService.getRequestWithBody(GET_ESP_DATA, {'count': 10});
      EspDataResponse parsedResponse = EspDataResponse.fromJson(response.data);
      print('cound${parsedResponse.data!.length}');
      return MyResponse(
          statusCode: 1,
          status: 'Success',
          data: parsedResponse,
          message: response.statusMessage.toString());
    } on DioError catch (e) {
      return MyResponse(statusCode: 0, status: 'Error', message: MyDioError.dioError(e));
    }
    catch (e) {
      rethrow;
      return MyResponse(statusCode: 0, status: 'Error', message: 'Error');
    } finally {

    }
  }

}