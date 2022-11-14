import 'package:json_annotation/json_annotation.dart';


import 'esp_data.dart';

part 'esp_data_response.g.dart';

@JsonSerializable()
class EspDataResponse{


  @JsonKey(name : "error")
  bool error;

  @JsonKey(name : "errorCode")
  String errorCode;

  @JsonKey(name : "totalSize")
  int totalSize;



  @JsonKey(name : "data")
  List<EspData>? data;




  EspDataResponse(this.error, this.errorCode, this.totalSize, this.data);

  factory EspDataResponse.fromJson(Map<String, dynamic> json) => _$EspDataResponseFromJson(json);
  Map<String, dynamic> toJson() => _$EspDataResponseToJson(this);

}