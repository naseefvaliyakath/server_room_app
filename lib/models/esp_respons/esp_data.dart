import 'package:json_annotation/json_annotation.dart';

part 'esp_data.g.dart';

@JsonSerializable()
class EspData{

  @JsonKey(name : "esp_id")
  int esp_id;

  @JsonKey(name : "temp1")
  num temp1;

  @JsonKey(name : "temp2")
  num temp2;


  @JsonKey(name : "hum")
  num hum;


  @JsonKey(name : "ups")
  int ups;

  @JsonKey(name : "powr")
  int powr;

  @JsonKey(name : "createdAt")
  DateTime createdAt;


  EspData(this.esp_id, this.temp1, this.temp2, this.hum, this.ups, this.powr,this.createdAt);

  factory EspData.fromJson(Map<String, dynamic> json) => _$EspDataFromJson(json);
  Map<String, dynamic> toJson() => _$EspDataToJson(this);
}