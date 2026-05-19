// import 'package:freezed_annotation/freezed_annotation.dart';
//
// part 'sign_up_request_body.g.dart';
// @JsonSerializable()
// class SignUpRequestBody {
// SignUpRequestBody({ required this.name , required this.email , required this.phone ,
//   required this.password , required this.passwordConfirmation ,required this.gender });
//
// final String name , email , phone ,password ,gender ;
//
// @JsonKey(name:" password_confirmation")
// final String   passwordConfirmation;
//
// Map<String , dynamic> toJson() => _$SignupRequestBodyToJson(this.);
// }

import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_request_body.g.dart';

@JsonSerializable()
class SignUpRequestBody {
  SignUpRequestBody({
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
    required this.passwordConfirmation,
    required this.gender,
  });

  final String name;
  final String email;
  final String phone;
  final String password;
  final int gender;

  @JsonKey(name: "password_confirmation")
  final String passwordConfirmation;

  Map<String, dynamic> toJson() =>
      _$SignUpRequestBodyToJson(this);


}