import 'package:booking/Features/SignUp/data/models/sign_up_request_body.dart';
import 'package:booking/Features/SignUp/data/models/sign_up_response.dart';

import '../../../../Core/networking/api_error_handler.dart';
import '../../../../Core/networking/api_result.dart';
import '../../../../Core/networking/api_service.dart';
import '../../../Login/data/models/login_request_body.dart';
import '../../../Login/data/models/login_response_body.dart';

class SignUpRepo{


  SignUpRepo(this._apiService);

  final ApiService _apiService;

  Future<ApiResult<SignUpResponse>> signUp (SignUpRequestBody signUpRequestBody) async {



    try {
      final response = await _apiService.signup(signUpRequestBody) ;
      return  ApiResult.success(response);
    } on Exception catch (e) {
      // api error handler
      return ApiResult.failure(ErrorHandler.handle(e) );
    }
  }
}