import 'dart:async';
import 'package:fl_chart/fl_chart.dart';
import 'package:dashbord/models/esp_respons/esp_data.dart';
import 'package:dashbord/models/esp_respons/esp_data_response.dart';
import 'package:dashbord/repo/esp_repo.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../constants/constants.dart';
import '../models/analytic_info_model.dart';
import '../models/dio_error.dart';
import '../models/my_response.dart';
import 'api_service.dart';

class ApiController extends GetxController {
  final HttpService _httpService = HttpService();
  final EspRepo _espRepo = EspRepo();

  Timer? _timer;
  int remainingSecond = 1;
  String time = '00.00';

  int temp1 = 0;
  int temp2 = 0;
  int hum = 0;
  int count = 0;

  int ups = 1;
  int powr = 1;
  double lastTemp = 0;

  final List<FlSpot> _spots = [];

  List<FlSpot> get spots => _spots;

  List<EspData> _espData = [];

  List<EspData> get espData => _espData;

  final List<double> _temp1List = [];

  List<double> get temp1List => _temp1List;

  final List<double> _temp2List = [];

  List<double> get temp2List => _temp2List;

  final List<double> _humList = [];

  List<double> get humList => _humList;

  List<AnalyticInfo> analyticDataList = [
    AnalyticInfo(
      title: "Rack Temp °C",
      count: 0,
      svgSrc: "assets/icons/Subscribers.svg",
      color: primaryColor,
    ),
    AnalyticInfo(
      title: "Room temp °C",
      count: 0,
      svgSrc: "assets/icons/Post.svg",
      color: purple,
    ),
    AnalyticInfo(
      title: "Humidity %",
      count: 0,
      svgSrc: "assets/icons/Pages.svg",
      color: orange,
    ),
    AnalyticInfo(
      title: "Battery",
      count: 0,
      svgSrc: "assets/icons/Comments.svg",
      color: green,
    ),
  ];

  String formattedDate = "";

  @override
  Future<void> onInit() async {
    await getCategory();
    analyticData();
    super.onInit();
  }

  @override
  void onReady() {
    _startTimer(1900);
    super.onReady();
  }

  @override
  void onClose() {
    if (_timer != null) {
      _timer!.cancel();
    }
    super.onClose();
  }

  _startTimer(int seconds) {
    const duration = Duration(seconds: 5);
    remainingSecond = seconds;
    _timer = Timer.periodic(duration, (Timer timer) {
      if (remainingSecond == 0) {
        timer.cancel();
      } else {
        int minit = remainingSecond ~/ 60;
        int second = (remainingSecond % 60);
        time =
            "${minit.toString().padLeft(2, "0")}:${second.toString().padLeft(2, "0")}";
        remainingSecond--;
        getCategory();
        analyticData();
        update();
        print('timer timessss $time');
      }
    });
  }

  // get category
  getCategory() async {
    try {
      MyResponse response = await _espRepo.getEspData();
      if (response.statusCode == 1) {
        EspDataResponse parsedResponse = response.data;
        if (parsedResponse.data == null) {
          _espData = [];
        } else {
          _espData = parsedResponse.data!;
          var now = DateTime.now();
          var formatter = DateFormat('HH:mm');
          // formattedDate = formatter.format(now);
          print('category $_espData');
        }
      } else {
        print(response.message);
        return;
      }
      update();
    } catch (e) {
      rethrow;
    }
  }

  analyticData() {
    temp1 = _espData!.fold(
        0, (previousValue, element) => previousValue + element.temp1.toInt());
    temp2 = _espData!.fold(
        0, (previousValue, element) => previousValue + element.temp2.toInt());
    hum = _espData!.fold(
        0, (previousValue, element) => previousValue + element.hum.toInt());
    count = _espData!.length;
    for (var element in _espData) {
      _temp1List.add(element.temp1.toDouble());
    }
    for (var element in _espData) {
      _temp2List.add(element.temp2.toDouble());
    }
    for (var element in _espData) {
      _humList.add(element.hum.toDouble());
    }
    if(_espData.isNotEmpty){
      ups = _espData.first.ups;
      powr = _espData.first.powr;
      lastTemp = _espData.first.temp1.toDouble();
      var formatter = DateFormat('HH:mm');
      formattedDate = formatter.format(_espData.first.createdAt);
    }
    _spots.clear();
    _espData.asMap().forEach((i, value) {
      _spots!.add(FlSpot(i * 10, _espData[i].temp1.toDouble()));
    });
    for (var element in _spots) {
      print('_spots ${element}');
    }
    updateAnalyticDataModel();
    update();
  }

  updateAnalyticDataModel() {
    analyticDataList = [
      AnalyticInfo(
        title: "Rack Temp °C",
        count: double.parse((temp1 / count).toStringAsExponential(3)) ?? 0,
        svgSrc: "assets/icons/temp.svg",
        color: primaryColor,
      ),
      AnalyticInfo(
        title: "Room temp °C",
        count: double.parse((temp2 / count).toStringAsExponential(3)) ?? 0,
        svgSrc: "assets/icons/temp.svg",
        color: purple,
      ),
      AnalyticInfo(
        title: "Humidity %",
        count: double.parse((hum / count).toStringAsExponential(3)) ?? 0,
        svgSrc: "assets/icons/hum.svg",
        color: orange,
      ),
      AnalyticInfo(
        title: "Battery",
        count: 100,
        svgSrc: "assets/icons/battery.svg",
        color: green,
      ),
    ];
    update();
  }
}
