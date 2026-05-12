import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_error_model.g.dart';


@JsonSerializable() //  لو سمحت ولّد كود تحويل JSON للكلاس ده
class ApiErrorModel{

  ApiErrorModel({
    required this.message,

    required this.code,
  });

  String message;

  int code;


factory ApiErrorModel.fromJson(Map<String , dynamic> json)=>
    _$ApiErrorModelFromJson(json);

Map<String ,dynamic> toJson()=> _$ApiErrorModelToJson(this);

}

