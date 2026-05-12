import 'package:booking/Core/networking/api_error_handler.dart';
import 'package:booking/Core/networking/api_result.dart';
import 'package:booking/Core/networking/api_service.dart';
import 'package:booking/Features/Login/data/models/login_request_body.dart';
import 'package:booking/Features/Login/data/models/login_response_body.dart';

class LoginRepo{

  LoginRepo(this._apiService);

  final ApiService _apiService;

  Future<ApiResult<LoginResponse>> login (LoginRequestBody loginRequestBody) async {



       try {
         final response = await _apiService.login(loginRequestBody) ;
         return  ApiResult.success(response);
       } on Exception catch (e) {
         // api error handler
         return ApiResult.failure(ErrorHandler.handle(e) );
       }
  }
}