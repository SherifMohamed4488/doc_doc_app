import 'package:booking/Core/networking/api_result.dart';
import 'package:booking/Features/Login/data/models/login_request_body.dart';
import 'package:booking/Features/Login/data/models/login_response_body.dart';
import 'package:booking/Features/Login/data/repos/login_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_states.dart';

class LoginCubit extends Cubit<LoginStates> {

  final LoginRepo _loginRepo;

  LoginCubit(this._loginRepo) : super(LoginStates.initial());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  void emitLoginStates(LoginRequestBody loginRequestBody) async {

    emit(LoginStates.loading());

    final response = await _loginRepo.login(loginRequestBody);

    response.when(
      success: (loginResponse) {

        emit(LoginStates.success(loginResponse));

      },

      failure: (error) {
         // error.apiErrorModel.message ?? ""
        emit(
          LoginStates.error(
            error: error.apiErrorModel.message ?? "",
          ),
        );

      },
    );
  }
}