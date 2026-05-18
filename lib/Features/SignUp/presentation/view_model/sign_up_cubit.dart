import 'package:booking/Core/networking/api_result.dart';
import 'package:booking/Features/SignUp/data/models/sign_up_request_body.dart';
import 'package:booking/Features/SignUp/data/repos/sign_up_repo.dart';
import 'package:booking/Features/SignUp/presentation/view_model/sign_up_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Login/presentation/view_model/login_cubit/login_states.dart';


class SignUpCubit extends Cubit<SignUpStates> {

  final SignUpRepo _signUpRepo;

  SignUpCubit(this._signUpRepo) : super(SignUpStates.initial());

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwrodConfirmationController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  void emitSignUpStates() async {

    emit(SignUpStates.loading());

    final response = await _signUpRepo.signUp(
        SignUpRequestBody(
          name: nameController.text,
      email: emailController.text,
      phone: phoneController.text,
      password: passwordController.text,
          passwordConfirmation: passwrodConfirmationController.text,
            gender: 0,

    ));

    response.when(
      success: (signupResponse) {

        emit(SignUpStates.success(signupResponse));

      },

      failure: (error) {
        // error.apiErrorModel.message ?? ""
        emit(
          SignUpStates.error(
            error: error.apiErrorModel.message ?? "",
          ),
        );

      },
    );
  }
}