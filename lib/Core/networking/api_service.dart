import 'package:booking/Features/Login/data/models/login_request_body.dart';
import 'package:booking/Features/Login/data/models/login_response_body.dart';
import 'package:booking/Features/SignUp/data/models/sign_up_request_body.dart';
import 'package:booking/Features/SignUp/data/models/sign_up_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'api_constants.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)

abstract class ApiService{

  factory ApiService(Dio dio ,{String baseUrl}) = _ApiService;

  @POST(ApiConstants.login)
  Future<LoginResponse> login (
 @Body() LoginRequestBody loginRequestBody,
  );

  @POST(ApiConstants.signup)
  Future<SignUpResponse> signup (
      @Body() SignUpRequestBody signUpRequestBody,
      );



}