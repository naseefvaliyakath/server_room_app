import 'package:dashbord/controllers/api_controller.dart';
import 'package:dashbord/repo/esp_repo.dart';
import 'package:get/get.dart';

import '../controllers/api_service.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<HttpService>(HttpService(),permanent: true);
    Get.put<EspRepo>(EspRepo(),permanent: true);
    Get.put<ApiController>(ApiController(),permanent: true);
  }
}